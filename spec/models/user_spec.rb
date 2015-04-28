require 'rails_helper'

RSpec.describe User, :type => :model do
  let!(:user) { User.create(:beard_length => 100)}

  describe "Serving user" do

    it 'User should not be trimed,shaved or massaged' do
      expect(user.trimed).to equal(false)
      expect(user.shaved).to equal(false)
      expect(user.massaged).to equal(false)
    end

    it 'Serve trim user' do
      user.trimming('10')
      expect(user.beard_length).to equal(90)
      expect(user.trimed).to equal(true)
    end

    it 'Serve trim user with length > beard length' do
      user.trimming('101')
      expect(user.beard_length).to equal(100)
      expect(user.trimed).to equal(false)
    end

    it 'Serve trim user with text length' do
      user.trimming("test")
      expect(user.beard_length).to equal(100)
      expect(user.trimed).to equal(false)
    end

    it 'Serve trim and massage user' do
      user.massaging_and_trimming('10',"Back massage")
      expect(user.beard_length).to equal(90)
      expect(user.trimed).to equal(true)
      expect(user.massaged).to equal(true)
    end

    it 'Serve trim and massage user with length > beard length' do
      user.massaging_and_trimming('101',"Back massage")
      expect(user.beard_length).to equal(100)
      expect(user.trimed).to equal(false)
      expect(user.massaged).to equal(false)
    end

    it 'Serve trim and massage user with text length' do
      user.massaging_and_trimming("test","Back massage")
      expect(user.beard_length).to equal(100)
      expect(user.trimed).to equal(false)
      expect(user.massaged).to equal(false)
    end

    it 'Serve shave user' do
      user.shaving
      expect(user.beard_length).to equal(0)
      expect(user.shaved).to equal(true)
    end
  end
end
