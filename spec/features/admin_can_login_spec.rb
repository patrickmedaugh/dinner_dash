require 'rails_helper'

RSpec.describe 'admin user' do
  context 'with an active account' do
    it 'can login' do
      create(:admin)
      visit login_path
      fill_in "session[username]", with: "jsmith"
      fill_in "session[password]", with: "password"
      click_button "Login"
      expect(page).to have_content("Admin John")
    end
  end
end
