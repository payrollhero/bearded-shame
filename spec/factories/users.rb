FactoryGirl.define do
  factory :user do
    first_name 'Test'
    last_name 'Demo'
    beard_length '100'
  end

  factory :user1 , parent: :user do
    first_name 'Test1'
    last_name 'Demo1'
    beard_length '100'
  end
end
