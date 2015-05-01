require 'spec_helper'

describe "User", :js => true do
  let!(:user) {FactoryGirl.create :user}

  it "shows a user on the root page" do
    visit root_path
    expect(page).to have_content(user.first_name)
  end

  it "shows all users on the show page" do
    visit root_path
    expect(page).to have_content(user.first_name)
  end

  context "Save User" do
    it "creates a new user" do
      visit root_path
      fill_in 'First name', with: user.first_name
      fill_in 'Last name', with: user.last_name
      fill_in 'Email', with: user.email
      fill_in 'Username', with: user.username
      fill_in 'Password', with: user.password
      click_on('Save User')
      expect(page).to have_content(user.first_name)
    end
  end

end