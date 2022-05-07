require 'rails_helper'

RSpec.describe 'CategoriesControllers', type: :request do
  describe 'GET/categories/new' do
    before do
      sign_in create(:user)
    end

    it 'returns the new page' do
      get '/categories/new'

      expect(response).to have_http_status(200)
    end
  end

  # POST Category
  describe 'POST/categories' do
    before do
      sign_in create(:user)
    end

    it 'creates a new category' do
      expect do
        post '/categories', params: { category: { title: 'New Category', description: 'HINDI KASI NAKA RTX' } }
      end.to \
        change(Category, :count)
        .by(1)

      expect(response).to have_http_status(302)
    end
  end
  # Edit Category
  describe 'GET/categories/1/edit' do
    before do
      sign_in create(:user)
    end

    it 'returns the edit page' do
      category = Category.create!({ title: 'New Category', description: 'HINDI KASI NAKA RTX' })
      get "/categories/#{category.id}/edit"

      expect(response).to have_http_status(200)
    end
  end

  # Update Category
  describe 'PATCH/categories/1/edit' do
    before do
      sign_in create(:user)
    end

    it 'updates the category' do
      category = Category.create!({ title: 'New Category', description: 'HINDI KASI NAKA RTX' })

      patch "/categories/#{category.id}",
            params: { category: { title: 'New edited', description: 'HINDI KASI NAKA RTX PARE' } }

      edited_category = Category.find(category.id)
      expect(edited_category.title).to eq 'New edited'
    end
  end

  # Show Category
  describe 'GET/categories/1' do
    before do
      sign_in create(:user)
    end

    it 'returns the category details page' do
      category = Category.create!({ title: 'New Category', description: 'HINDI KASI NAKA RTX' })
      get "/categories/#{category.id}"

      expect(response).to have_http_status(200)
    end
  end
end

