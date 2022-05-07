class CategoriesController < ApplicationController
  before_action :authenticate_user!

  def index
    @categories = Category.all
    # @categories = Category.find(1).tasks.where(user_id: current_user.id)
  end

  def new
    @category = Category.new
  end

  def show
    @category = Category.find(params[:id])
  end

  def create
    @category = Category.new(category_params)
    redirect_to '/categories' if @category.save
  end

  def edit
    @category = Category.find(params[:id])
  end

  def update
    @category = Category.find(params[:id])
    redirect_to '/categories' if @category.update!(category_params)
  end

  def destroy
    @category = Category.destroy(params[:id])

    redirect_to '/categories' if @category.destroy!
  end

  private

  def category_params
    params.require(:category).permit(:title, :description)
  end
end

