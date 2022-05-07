require 'rails_helper'

RSpec.describe Category, type: :model do
  let!(:category) { Category.new }

  context 'Validations' do
    it '1. is not valid without a title' do
      category.description = 'Sample desc'

      expect(category).to_not be_valid
      # expect(category.errors).to be_present
      # expect(category.errors.to_h.keys).to include(:title)
    end

    it '2. should have a title with max length of 18' do
      category.title = 'qweqweqweqweqweqweqwe' # 21 chars

      expect(category).to_not be_valid
    end

    it '3. should have a unique title' do
      Category.create(title: 'Breaking Dawn')
      category.title = 'Breaking Dawn'

      expect(category).to_not be_valid
    end

    it '4. should create a valid category' do
      category.title = 'Breaking Dawn'

      expect(category).to be_valid
    end
  end
end

