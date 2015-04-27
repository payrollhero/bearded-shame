require 'spec_helper'

describe 'User' do
  context 'creating a user' do
    let(:correct_params)   { {:first_name => "James", :last_name => "Jones"}}
    let(:incorrect_params) { {:last_name => "No First Name"}}

    it 'should create user with correct parameters' do
      user = User.create_from_params(correct_params)
      expect(user.errors.messages).to be_blank
    end

    it 'should not create user with incorrect parameters' do
      user = User.create_from_params(incorrect_params)
      expect(user.errors.messages).to_not be_blank
      expect(user.errors.messages[:first_name]).to_not be_blank
      expect(user.errors.messages[:first_name]).to include("can't be blank")
    end

  end
end
