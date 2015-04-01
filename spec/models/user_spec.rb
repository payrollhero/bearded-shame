require 'rails_helper'

RSpec.describe User, type: :model do

  it 'is valid with a firstname and lastname' do
    user = User.new(first_name: 'Shinya', last_name: 'Kitamura')
    expect(user).to be_valid
    expect(user.fullname).to eq 'Shinya Kitamura'
  end

  it 'is invalid without a firstname' do
    user = User.new(first_name: nil, last_name: 'Kitamura')
    expect(user).to be_invalid
  end

  it 'is invalid without a lastname' do
    user = User.new(first_name: 'Shinya', last_name: nil)
    expect(user).to be_invalid
  end

end
