FactoryGirl.define do
  factory :user do

    trait :alice do
      first_name "Alice"
      last_name "Aardvaark"
      email "alice@ardvaark.com"
    end

    trait :bob do
      first_name "Bob"
      last_name "Babelfish"
      email "bob@babelfish.com"
    end

  end
end
