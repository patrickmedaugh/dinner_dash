FactoryGirl.define do

  factory :item do
             title "Pikachu"
             description "Good"
             price 900
    end

    factory :item_with_categories, :parent => :item do
      categories {[FactoryGirl.create(:category)]}
    end

end
