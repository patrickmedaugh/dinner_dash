require 'rails_helper'

RSpec.describe Order, type: :model do
  context 'with valid params' do
    it 'is valid' do
      order = create(:order)
      expect(order).to be_valid
    end

    it 'has one or more items' do
      order = create(:order)
      expect(order.items).to eq([])
    end

  end

  context 'with invalid params' do
    it 'is invalid without a valid status' do
      order = create(:order)
      order.status = ""
      expect(order).to_not be_valid
      order.status = "done"
      expect(order).to_not be_valid
    end

    it 'is invalid without a user id' do
      order = create(:order)
      order.user_id = ""
      expect(order).to_not be_valid
    end
  end

end
