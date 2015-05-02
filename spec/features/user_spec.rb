require 'spec_helper'

describe "User", :js => true do
  let!(:user) {FactoryGirl.create :user}

  context "Save User" do
    it "creates a new user" do
      visit root_path
      click_on("Sign Up!")
      fill_in 'First name', with: "caroline"
      fill_in 'Last name', with: user.last_name
      fill_in 'Email', with: user.email
      fill_in 'Username', with: user.username
      fill_in 'Password', with: user.password
      click_on('Save User')
      sleep(5)
      expect(page).to have_content("caroline")
    end
  end

  it "shows all users on the index page" do
    visit root_path
    expect(page).to have_content(user.first_name)
  end

end