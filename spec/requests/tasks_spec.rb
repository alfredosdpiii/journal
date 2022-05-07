require 'rails_helper'

RSpec.describe 'TasksControllers', type: :request do
  describe 'GET/categories/tasks' do
    before do
      sign_in create(:user)
    end

    it 'returns the new task page' do
      category = Category.create!({ title: 'New Category', description: 'HINDI KASI NAKA RTX' })
      get "/categories/#{category.id}/tasks/new"

      expect(response).to have_http_status(200)
    end
  end
end
