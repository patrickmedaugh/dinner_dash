require 'rails_helper'

RSpec.describe 'user' do
  context 'with an active account' do
    it 'can login' do
      create(:user)
      visit login_path
      fill_in "session[username]", with: "sjones"
      fill_in "session[password]", with: "password"
      click_button "Login"
      expect(page).to have_content("Steve")
    end
  end
end
