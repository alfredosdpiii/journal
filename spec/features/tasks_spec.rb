require 'rails_helper'

RSpec.describe 'Tasks', type: :request do
  describe 'visit new task page' do
    before do
      sign_in create(:user)
    end

    let(:category) { Category.create!(title: 'title', description: 'description') }
    before { visit "/categories/#{category.id}/tasks/new" }

    it 'shows a new page' do
      expect(page).to have_content 'Body'
      expect(page).to have_selector(:link_or_button, 'Create Task')
    end
  end

  describe 'create a new task' do
    before do
      sign_in create(:user)
    end

    let(:category) { Category.create!(title: 'title', description: 'description') }
    before { visit "/categories/#{category.id}/tasks/new" }

    it 'submits a form' do
      within 'form' do
        fill_in 'task_body', with: 'test'
        click_on 'Create Task'
      end
      expect(Task.count).to eq(1)
    end
  end

  describe 'show a task' do
    before do
      sign_in create(:user)
    end

    let(:category) { Category.create!(title: 'title', description: 'description') }
    let(:task) { category.tasks.create!(body: 'task', user: User.first) }
    before { visit "/categories/#{category.id}/tasks/#{task.id}" }

    it 'shows a task page' do
      expect(page).to have_content 'Body'
      expect(page).to have_selector(:link_or_button, 'Edit this task')
      expect(page).to have_selector(:link_or_button, 'Delete')
    end
  end

  describe 'edit a task' do
    before do
      sign_in create(:user)
    end

    let(:category) { Category.create!(title: 'title', description: 'description') }
    let(:task) { category.tasks.create!(body: 'task', user: User.first) }
    before { visit "/categories/#{category.id}/tasks/#{task.id}/edit" }

    it 'submits a form' do
      within 'form' do
        fill_in 'task_body', with: 'test'
        click_on 'Update Task'
      end

      edited_task = category.tasks.find(task.id)
      expect(edited_task.body).to eq('test')
    end
  end

  describe 'delete a task' do
    before do
      sign_in create(:user)
    end

    let(:category) { Category.create!(title: 'test', description: 'description') }
    let(:task) { category.tasks.create!(body: 'task', user: User.first) }
    before { visit "/categories/#{category.id}/tasks/#{task.id}" }

    it 'clicks a button' do
      click_on 'Delete'

      expect(category.tasks.count).to eq(0)
    end
  end
end
