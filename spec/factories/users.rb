FactoryGirl.define do
  factory :fake_user, class: User do
    email Faker::Internet.email
    password Faker::Internet.password
  end

end
