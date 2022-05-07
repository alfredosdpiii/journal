require 'rails_helper'

RSpec.describe "TasksControllers", type: :request do
  describe "GET/categories/tasks" do
    before do
      sign_in create(:user)
    end

    it "returns the new task page" do
      category = Category.create!({title: "New Category", description: "HINDI KASI NAKA RTX"})
      get "/categories/#{category.id}/tasks/new"

      expect(response).to have_http_status(200)
    end
  end

#   #POST Category
#   describe "POST/categories" do
#     it "creates a new category" do
      
#       expect { post "/categories", params: {category: {title: "New Category", description: "HINDI KASI NAKA RTX"}} }.to \
#         change(Category, :count)
#         .by(1)

#       expect(response).to have_http_status(302)
#     end
#   end
#   #Edit Category
#   describe "GET/categories/1/edit" do
#     it "returns the edit page" do
#       category = Category.create!({title: "New Category", description: "HINDI KASI NAKA RTX"})
#       get "/categories/#{category.id}/edit"

#       expect(response).to have_http_status(200)
#     end
#   end

#   #Update Category
#   describe "PATCH/categories/1/edit" do
#     it "updates the category" do
#       category = Category.create!({title: "New Category", description: "HINDI KASI NAKA RTX"})
      
#       patch "/categories/#{category.id}", params: {category: {title: "New edited", description: "HINDI KASI NAKA RTX PARE"}}

#       edited_category = Category.find(category.id)
#       expect(edited_category.title).to eq 'New edited'
#     end
#   end

  
#   #Show Category
#   describe "GET/categories/1" do
#     it "returns the category details page" do
#       category = Category.create!({title: "New Category", description: "HINDI KASI NAKA RTX"})
#       get "/categories/#{category.id}"

#       expect(response).to have_http_status(200)
#     end
#   end
end