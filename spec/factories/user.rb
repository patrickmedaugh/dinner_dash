FactoryGirl.define do
  factory :user do
    first_name "Steve"
    last_name  "Jones"
    username   "sjones"
    email      "s@jones.com"
    password   "password"
    role        0
  end

  factory :admin, class: User do
    first_name "John"
    last_name  "Smith"
    username   "jsmith"
    email      "j@smith.com"
    password   "password"
    role      1
  end
end
