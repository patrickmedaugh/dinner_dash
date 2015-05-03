require 'rails_helper'

RSpec.describe 'unauthenticated user' do
  it 'can see a list of all items in a category' do
    item = create(:item_with_categories)
    visit category_path(item.categories.first)
    expect(page).to have_content("Pikachu")
  end
end
