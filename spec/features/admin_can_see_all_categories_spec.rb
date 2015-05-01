require 'rails_helper'

RSpec.describe 'admin' do
  context 'with valid credentials' do
    it 'can see all categories' do
      admin = create(:admin)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)
      create(:category)
      create(:category, name: "Fire")
      visit admin_categories_path
      expect(page).to have_content("Fire")
    end
  end
end
