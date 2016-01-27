FactoryGirl.define do
  factory :my_dad, class: ExampleUser do
    name "KJI"
    email "kji@yahoo.com.tw"
    age 38
    password "0114"
    is_available true
  end

  factory :random_user, class: ExampleUser do
    name Faker::Name.name
    email Faker::Internet.email
    age Faker::Number.between(1, 100)
    password Faker::Internet.password
    is_available false
  end
end
