require 'rails_helper'

RSpec.describe Category, type: :model do
  context 'with valid params' do
    it 'is valid' do
      category = create(:category)
      expect(category).to be_valid
    end

    it 'has one or many items' do
      # category.save
      category = create(:category)
      expect(category.items).to eq([])
    end
  end

  context 'with invalid params' do
    it 'is invalid without a name' do
      category = create(:category)
      category.name = ""
      expect(category).to_not be_valid
    end
  end
end
