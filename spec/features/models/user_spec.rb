require 'rails_helper'

RSpec.describe User, :type => :feature do

  context 'testing app' do
    let!(:user) { FactoryGirl.create(:user) }
    let!(:user1) { FactoryGirl.create(:user1)}

    describe "Serving user" do

      it 'New default user should not be trimed,shaved or massaged' do
        expect(user1.trimed).to equal(false)
        expect(user1.shaved).to equal(false)
        expect(user1.massaged).to equal(false)
      end

      it 'Serve trim user' do
        user1.trimming('10')
        expect(user1.beard_length).to equal(90)
        expect(user1.trimed).to equal(true)
      end

      it 'Serve trim user, browser test' ,:chrome do
        old_beard = user.beard_length
        visit root_path
        find(".trim",match: :first).click
        fill_in("length",with: 1)
        find("input[type=submit]").click
        expect(page).to have_content(I18n.t('userHasBeenTrimed',username: user.fullname ))

        visit root_path
        find(".trim",match: :first).click
        expect_value = old_beard-1
        expect(find(".beardLength").text).to eq(expect_value.to_s)
      end

      it 'Serve trim user with length > beard length' do
        user1.trimming('101')
        expect(user1.beard_length).to equal(100)
        expect(user1.trimed).to equal(false)
      end

      it 'Serve trim user with length > beard length , browser test' ,:chrome do
        old_beard = user.beard_length
        visit root_path
        find(".trim",match: :first).click
        fill_in("length",with: user.beard_length+1)
        find("input[type=submit]").click
        expect(page).to have_content(I18n.t('beardError'))

        visit root_path
        find(".trim",match: :first).click
        expect(find(".beardLength").text).to eq(old_beard.to_s)
      end

      it 'Serve trim user with text length' do
        user1.trimming("test")
        expect(user1.beard_length).to equal(100)
        expect(user1.trimed).to equal(false)
      end

      it 'Serve trim user with text length , browser test' ,:chrome  do
        old_beard = user.beard_length
        visit root_path
        find(".trim",match: :first).click
        fill_in("length",with: "test")
        find("input[type=submit]").click
        expect(page).to have_content(I18n.t('beardError'))

        visit root_path
        find(".trim",match: :first).click
        expect(find(".beardLength").text).to eq(old_beard.to_s)
      end

      it 'Serve trim and massage user' do
        user1.massaging_and_trimming('10',"Back massage")
        expect(user1.beard_length).to equal(90)
        expect(user1.trimed).to equal(true)
        expect(user1.massaged).to equal(true)
        expect(user1.last_massage_type.to_s).to eq('Back massage')
      end

      it 'Serve trim and massage user, browser test' ,:chrome  do
        old_beard = user.beard_length
        visit root_path
        find(".massage_and_trim",match: :first).click
        fill_in("length",with: 1)
        find("input[type=submit]").click
        expect(page).to have_content(I18n.t('userHasBeenMassagedAndTrimed',username: user.fullname))

        visit root_path
        expect_value = old_beard-1
        find(".massage_and_trim",match: :first).click
        expect(find(".beardLength").text).to eq(expect_value.to_s)
      end

      it 'Serve trim and massage user with length > beard length' do
        user1.massaging_and_trimming('101',"Back massage")
        expect(user1.beard_length).to equal(100)
        expect(user1.trimed).to equal(false)
        expect(user1.massaged).to equal(false)
      end

      it 'Serve trim and massage user with length > beard length, browser test' ,:chrome do
        old_beard = user.beard_length
        visit root_path
        find(".massage_and_trim",match: :first).click
        fill_in("length",with: user.beard_length+1)
        find("input[type=submit]").click
        expect(page).to have_content(I18n.t('beardError'))

        visit root_path
        find(".massage_and_trim",match: :first).click
        expect(find(".beardLength").text).to eq(old_beard.to_s)
      end

      it 'Serve trim and massage user with text length' do
        user1.massaging_and_trimming("test","Back massage")
        expect(user1.beard_length).to equal(100)
        expect(user1.trimed).to equal(false)
        expect(user1.massaged).to equal(false)
      end

      it 'Serve trim and massage user with text length, browser test' ,:chrome  do
        old_beard = user.beard_length
        visit root_path
        find(".massage_and_trim",match: :first).click
        fill_in("length",with: "test")
        find("input[type=submit]").click
        expect(page).to have_content(I18n.t('beardError'))

        visit root_path
        find(".massage_and_trim",match: :first).click
        expect(find(".beardLength").text).to eq(old_beard.to_s)
      end

      it 'Serve shave user' do
        user1.shaving
        expect(user1.beard_length).to equal(0)
        expect(user1.shaved).to equal(true)
      end

      it 'Serve trim and massage user with text length, browser test' ,:chrome  do
        visit root_path
        find(".shave",match: :first).click
        find("input[type=submit]").click
        expect(page).to have_content(I18n.t('userHasBeenShaved',username: user.fullname))

        visit root_path
        find(".shave",match: :first).click
        expect(find(".beardLength").text).to eq("0")
      end

    end
  end
end
