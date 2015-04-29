require 'spec_helper'

describe "User", :js => true do
  let!(:user) {FactoryGirl.create :user}

  it "shows a user on the root page" do
    visit root_path
    expect(page).to have_content(user.first_name)
  end
end