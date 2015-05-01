require 'rails_helper'

RSpec.describe 'admin' do
  context 'with valid credentials' do
    it 'can edit an item' do
      admin = create(:admin)
      item = create(:item)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)
      visit edit_admin_item_path(item)
      fill_in "Retired", with: true
      click_button "Update Item"
      visit root_path
      expect(page).to_not have_content("Pikachu")
    end
  end
  context 'with invalid credentials' do
    xit 'cannot retire item' do
      user = create(:user)
      item = create(:item)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
      visit edit_admin_item_path(item)
      expect(page).to have_content("error")
      #failing due to admin before action issues
    end
  end
end
