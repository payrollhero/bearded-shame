require 'rails_helper'

RSpec.describe User, :type => :feature do

  context 'testing app' do
    let!(:user) { User.create(:first_name =>'Peter' , :last_name =>'Adam', :beard_length => 100)}

    describe "Serving user" do

      before(:all) do
        FactoryGirl.create(:user)
      end

      it 'New default user should not be trimed,shaved or massaged' do
        expect(user.trimed).to equal(false)
        expect(user.shaved).to equal(false)
        expect(user.massaged).to equal(false)
      end

      it 'Serve trim user' do
        user.trimming('10')
        expect(user.beard_length).to equal(90)
        expect(user.trimed).to equal(true)
      end

      it 'Serve trim user, browser test' do
        old_beard = User.first.beard_length
        visit root_path
        find(".trim",match: :first).click
        fill_in("length",with: 1)
        find("input[type=submit]").click
        expect(page).to have_content("#{User.first.fullname} has been trimed")

        visit root_path
        find(".trim",match: :first).click
        expect_value = old_beard-1
        expect(find(".beardLength").text).to eq(expect_value.to_s)
      end

      it 'Serve trim user with length > beard length' do
        user.trimming('101')
        expect(user.beard_length).to equal(100)
        expect(user.trimed).to equal(false)
      end

      it 'Serve trim user with length > beard length , browser test' do
        old_beard = User.first.beard_length
        visit root_path
        find(".trim",match: :first).click
        fill_in("length",with: User.first.beard_length+1)
        find("input[type=submit]").click
        expect(page).to have_content("Length should be a integer less than beard length")

        visit root_path
        find(".trim",match: :first).click
        expect(find(".beardLength").text).to eq(old_beard.to_s)
      end

      it 'Serve trim user with text length' do
        user.trimming("test")
        expect(user.beard_length).to equal(100)
        expect(user.trimed).to equal(false)
      end

      it 'Serve trim user with text length , browser test' do
        old_beard = User.first.beard_length
        visit root_path
        find(".trim",match: :first).click
        fill_in("length",with: "test")
        find("input[type=submit]").click
        expect(page).to have_content("Length should be a integer less than beard length")

        visit root_path
        find(".trim",match: :first).click
        expect(find(".beardLength").text).to eq(old_beard.to_s)
      end

      it 'Serve trim and massage user' do
        user.massaging_and_trimming('10',"Back massage")
        expect(user.beard_length).to equal(90)
        expect(user.trimed).to equal(true)
        expect(user.massaged).to equal(true)
        expect(user.last_massage_type.to_s).to eq('Back massage')
      end

      it 'Serve trim and massage user, browser test' do
        old_beard = User.first.beard_length
        visit root_path
        find(".massage_and_trim",match: :first).click
        fill_in("length",with: 1)
        find("input[type=submit]").click
        expect(page).to have_content("#{User.first.fullname} has been massaged and trimed")

        visit root_path
        expect_value = old_beard-1
        find(".massage_and_trim",match: :first).click
        expect(find(".beardLength").text).to eq(expect_value.to_s)
      end

      it 'Serve trim and massage user with length > beard length' do
        user.massaging_and_trimming('101',"Back massage")
        expect(user.beard_length).to equal(100)
        expect(user.trimed).to equal(false)
        expect(user.massaged).to equal(false)
      end

      it 'Serve trim and massage user with length > beard length, browser test' do
        old_beard = User.first.beard_length
        visit root_path
        find(".massage_and_trim",match: :first).click
        fill_in("length",with: User.first.beard_length+1)
        find("input[type=submit]").click
        expect(page).to have_content("Length should be a integer less than beard length")

        visit root_path
        find(".massage_and_trim",match: :first).click
        expect(find(".beardLength").text).to eq(old_beard.to_s)
      end

      it 'Serve trim and massage user with text length' do
        user.massaging_and_trimming("test","Back massage")
        expect(user.beard_length).to equal(100)
        expect(user.trimed).to equal(false)
        expect(user.massaged).to equal(false)
      end

      it 'Serve trim and massage user with text length, browser test' do
        old_beard = User.first.beard_length
        visit root_path
        find(".massage_and_trim",match: :first).click
        fill_in("length",with: "test")
        find("input[type=submit]").click
        expect(page).to have_content("Length should be a integer less than beard length")

        visit root_path
        find(".massage_and_trim",match: :first).click
        expect(find(".beardLength").text).to eq(old_beard.to_s)
      end

      it 'Serve shave user' do
        user.shaving
        expect(user.beard_length).to equal(0)
        expect(user.shaved).to equal(true)
      end

      it 'Serve trim and massage user with text length, browser test' do
        visit root_path
        find(".shave",match: :first).click
        find("input[type=submit]").click
        expect(page).to have_content("#{User.first.fullname} has been shaved")

        visit root_path
        find(".shave",match: :first).click
        expect(find(".beardLength").text).to eq("0")
      end

    end
  end
end
