FactoryGirl.define do
  factory :user do
    first_name Faker::Name.first_name
    last_name Faker::Name.last_name
    beard_length Faker::Number.number(3)
  end

  factory :user1 , parent: :user do
    first_name Faker::Name.first_name
    last_name Faker::Name.last_name
    beard_length 100
  end
end
