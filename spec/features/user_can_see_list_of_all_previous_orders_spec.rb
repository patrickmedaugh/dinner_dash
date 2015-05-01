require 'rails_helper'

RSpec.describe 'user' do
  context 'with a history of orders' do
    it 'can see a list of previous orders' do
      user = create(:user)
      visit login_path
      create(:order)
      user.save
      fill_in "session[username]", with: "jsmith"
      fill_in "session[password]", with: "password"
      click_link_or_button "Login"
      click_link_or_button "My Orders"
      expect(page).to have_content("completed")
    end
  end
end
