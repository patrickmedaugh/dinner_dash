require 'rails_helper'

RSpec.describe 'unauthenticated user can see a details of an individual item' do
  it 'shows items' do
    item = create(:item)
    item.save
    visit item_path(item)
    expect(page).to have_content("Pikachu")
  end
end
