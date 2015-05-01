require 'rails_helper'

RSpec.describe 'User' do
  context 'with valid params' do
    it 'is valid' do
      user = create(:user)
      expect(user).to be_valid
    end

    it 'has orders' do
      user = create(:user)
      expect(user.orders).to eq([])
    end
  end

  context 'with invalid params' do
    it 'is invalid without a first_name' do
      user = create(:user)
      user.first_name = ''
      expect(user).to_not be_valid
    end

    it 'is invalid without a last_name' do
      user = create(:user)
      user.last_name = ''
      expect(user).to_not be_valid
    end

    it 'is invalid without a username' do
      user = create(:user)
      user.username = ''
      expect(user).to_not be_valid
    end

    it 'is invalid without a email' do
      user = create(:user)
      user.email = ''
      expect(user).to_not be_valid
      user.email = 'barry@whitehouse'
      expect(user).to_not be_valid
    end

    it 'is invalid without a matching password combination' do
      user = create(:user)
      user.password_confirmation = ''
      expect(user).to_not be_valid
    end

    it 'is invalid with a short or long username' do
      user = create(:user)
      user.username = 'B'
      expect(user).to_not be_valid
      user.username = "123456789012345678901234567890123"
      expect(user).to_not be_valid
    end

  end
end
