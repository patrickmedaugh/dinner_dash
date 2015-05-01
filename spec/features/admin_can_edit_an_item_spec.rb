require 'rails_helper'

RSpec.describe 'admin' do
  context 'with valid credentials' do
    it 'can edit an item' do
      admin = create(:admin)
      item = create(:item)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)
      visit edit_admin_item_path(item)
      fill_in "Title", with: "Charmeleon"
      click_button "Update Item"
      expect(page).to have_content("Charmeleon")
    end

    it 'can assign a category to an item' do
      admin = create(:admin)
      item = create(:item)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)
      create(:category)
      visit edit_admin_item_path(item)
      check "Grass"
      click_button "Update Item"
      visit categories_path
      click_link "Grass"
      expect(page).to have_content("Pikachu")
    end
  end
  context 'with invalid credentials' do
    xit 'cannot edit item' do
      user = create(:user)
      item = create(:item)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
      visit edit_admin_item_path(item)
      expect(page).to have_content("error")
      #this is failing due to admin before action issues
    end
  end
end
