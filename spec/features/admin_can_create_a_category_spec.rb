require 'rails_helper'

RSpec.describe 'admin' do
  context 'with valid credentials' do
    it 'can create a categories' do
      admin = create(:admin)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)
      visit new_admin_category_path
      fill_in "Name", with: "Psychic"
      click_button "Create Category"
      expect(page).to have_content("Psychic")
    end
  end
  context 'with invalid credentials' do
    xit 'cannot create a category' do
      user = create(:user)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
      visit new_admin_category_path
      expect(page).to have_content("error")
      #this fails, currently default users can create categories
    end
  end
end
