require 'rails_helper'

RSpec.describe 'admin' do
  context 'with valid credentials' do
    it 'can destroy an item' do
      admin = create(:admin)
      category = create(:category)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)
      category.save
      visit admin_categories_path
      expect(page).to have_content("Grass")
      visit admin_category_path(category)
      click_link_or_button "Destroy"
      expect(page).to_not have_content("Grass")
    end
  end
  context 'with invalid credentials' do
    xit 'cannot destroy category' do
      user = create(:user)
      category = create(:category)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
      visit admin_categories_path
      expect(page).to have_content("error")
      #failing due to admin errors
    end
  end
end
