require 'rails_helper'

RSpec.describe 'Categories', type: :feature do
  describe 'View new category page' do
    before do
      sign_in create(:user)
    end

    before { visit new_category_path }

    it 'shows a new page' do
      expect(page).to have_content 'Title'
      expect(page).to have_content 'Description'
      expect(page).to have_selector(:link_or_button, 'Create Category')
    end
  end

  describe 'fill up form and submit' do
    before do
      sign_in create(:user)
    end

    before { visit new_category_path }

    it 'submits the form' do
      within 'form' do
        fill_in 'category_title', with: 'test'
        fill_in 'category_description', with: 'testing'
        click_on 'Create Category'
      end

      expect(page).to have_content 'Categories'
    end
  end

  describe 'edit a category' do
    before do
      sign_in create(:user)
    end

    let(:category) { Category.create!(title: 'test', description: 'hehe') }
    before { visit "/categories/#{category.id}/edit" }

    it 'edits the form' do
      within 'form' do
        fill_in 'category_title', with: 'test'
        fill_in 'category_description', with: 'rtx'
        click_on 'Update Category'
      end

      new_category = Category.find(category.id)
      expect(new_category.title).to eq 'test'
    end
  end

  describe 'delete a category' do
    before do
      sign_in create(:user)
    end

    let(:category) { Category.create!(title: 'test', description: 'hehe') }
    before { visit "/categories/#{category.id}" }

    it 'deletes the category' do
      expect(page).to have_selector(:link_or_button, 'Destroy this category')

      click_on 'Destroy this category'

      expect(Category.count).to eq(0)
    end
  end
end

