require 'rails_helper'

RSpec.describe Task, type: :model do
  before do
    sign_in create(:user)
  end

  let!(:category) { Category.new }
  let!(:task) { category.tasks.new }

  context 'Validations' do
    it 'should create a valid task' do
      task.body = 'Test'
      task.user_id = User.first.id

      expect(task).to be_valid
    end

    it 'is not valid without a body' do
      task.body = nil

      expect(task).to_not be_valid
    end
  end
end

