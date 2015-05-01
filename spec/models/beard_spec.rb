require 'spec_helper'

describe 'Beard' do
  before { User.create!(:first_name => "Paul", :last_name => "Jones") }

  context 'creating/updating a user beard' do
    let(:user) { User.first }

    it 'should not create beard if user_id is null' do
      beard = Beard.new
      beard.status = 'unset'
      beard.save

      expect(beard.errors.messages).to_not be_blank
      expect(beard.errors.messages[:user_id]).to_not be_blank
      expect(beard.errors.messages[:user_id]).to include("can't be blank")
    end

    it 'should create user beard with correct parameters' do
      beard = Beard.new
      beard.user   = user
      beard.status = 'unset'
      beard.save

      expect(beard.errors.messages).to be_blank
    end

    it 'should not create beard if status is null' do
      beard = Beard.new
      beard.user   = user
      beard.status = nil
      beard.save

      expect(beard.errors.messages).to_not be_blank
      expect(beard.errors.messages[:status]).to_not be_blank
      expect(beard.errors.messages[:status]).to include("can't be blank")
    end

    it 'should save if status is valid' do
      beard = user.beard
      beard.update_status!(:status => 'shaved')

      expect(beard.errors.messages).to be_blank
    end


    it 'should not save if status is not valid' do
      beard = user.beard
      beard.update_status!(:status => 'invalid_status')

      expect(beard.errors.messages).to_not be_blank
      expect(beard.errors.messages[:status]).to_not be_blank
      expect(beard.errors.messages[:status]).to include("beard status invalid")
    end

  end
end

