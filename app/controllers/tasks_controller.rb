class TasksController < ApplicationController
  before_action :get_category, except: [:todays_tasks]

  def index
    @tasks = @category.tasks.where(user_id: current_user.id)
  end

  def new
    @task = @category.tasks.build
  end

  def show
    @task = @category.tasks.find(params[:id])
  end

  def edit
    @task = @category.tasks.find(params[:id])
  end

  def update
    @task = @category.tasks.find(params[:id])
    redirect_to category_tasks_path(@category) if @task.update!(task_params)
  end

  def create
    @task = @category.tasks.build(task_params)
    if @task.save
      redirect_to category_tasks_path
    else
      render :new
    end
  end

  def destroy
    @task = @category.tasks.find(params[:id])

    redirect_to category_tasks_path(@category) if @task.destroy!
  end

  def todays_tasks(now = Time.now)
    @tasks = Task.where('created_at BETWEEN ? AND ?', now.at_beginning_of_day,
                        now.tomorrow.at_beginning_of_day).where(user_id: current_user.id)
  end

  private

  def get_category
    @category = Category.find(params[:category_id])
  end

  def task_params
    params.require(:task).permit(:body, :category_id, :user_id)
  end
end
