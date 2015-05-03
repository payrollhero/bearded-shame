require 'rails_helper'

describe User do
  it { should have_one(:user_favorite_massage) }
  it { should have_many(:orders) }

  subject { create :user }

  describe :name do
    it 'should return the name if one is defined' do
      name = {first_name: 'FirstName', last_name: 'LastName'}
      expect(create(:user, name).name).to eq 'FirstName LastName'
    end

    it 'should return email if no name is defined' do
      name = {first_name: '', last_name: ''}
      subject = create(:user, name)
      expect(subject.name).to eq subject.email
    end
  end

  describe :full_name do
    it 'should return the first_name and last_name joined' do
      name = {first_name: 'FirstName', last_name: 'LastName'}
      expect(create(:user, name).full_name).to eq 'FirstName LastName'
    end

    it 'should return empty string if no name is defined' do
      name = {first_name: '', last_name: ''}
      subject = create(:user, name)
      expect(subject.full_name).to eq ''
    end
  end

  describe 'method :full_name=' do
    it 'sets to frist_name sinle word' do
      subject.full_name = 'Bob'
      expect(subject.first_name).to eq 'Bob'
      expect(subject.last_name).to be nil
    end

    it 'sets to frist_name and last_name two words' do
      subject.full_name = 'Bob Zlow'
      expect(subject.first_name).to eq 'Bob'
      expect(subject.last_name).to eq 'Zlow'
    end

    it 'sets all the three fields if more than two words are given' do
      subject.full_name = 'Bob A B C Zlow'
      expect(subject.first_name).to eq 'Bob'
      expect(subject.last_name).to eq 'Zlow'
    end
  end

end
