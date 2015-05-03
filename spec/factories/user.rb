FactoryGirl.define do
  factory :user do
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.first_name }
    email { Faker::Internet.email }
    password "password"
    password_confirmation "password"

    trait :confirmed do
      confirmed_at 1.day.ago
    end

    trait :old do
      confirmed
      current_login_at {5.minutes.ago}
      current_login_ip '213.180.204.3'
      last_login_at {3.days.ago}
      last_login_ip '213.180.193.3'
      last_request_at {2.minutes.ago}
      login_count {rand 5..500}
    end

  end
end
