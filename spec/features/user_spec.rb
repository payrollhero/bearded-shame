require 'rails_helper'

feature "User index" do

  let(:alice) { create(:user, :alice) }
  let(:bob)   { create(:user, :bob) }

  before do
    alice.save
    bob.save
    visit "/"
  end

  feature "page" do
    scenario "should have create link" do
      expect(page).to have_content("Create user")
    end
    scenario "should have search input" do
      expect(page).to have_selector("input[type=text]")
    end
    scenario "should have clear button" do
      expect(page).to have_selector("button[type=submit]")
    end
    scenario "should have trim link" do
      expect(page).to have_css("a.trim")
    end
    scenario "should have massage and trim link" do
      expect(page).to have_css("a.massage-trim")
    end
    scenario "should have shave link" do
      expect(page).to have_css("a.shave")
    end
    scenario "should have delete link" do
      expect(page).to have_css("a.delete-user")
    end
    scenario "should display all users" do
      expect(page).to have_content "#{alice.decorate.full_name}"
      expect(page).to have_content "#{bob.decorate.full_name}"
    end
  end

  feature "Create user" do
    scenario "Create user links visits new user page" do
      click_link "Create user"
      expect(page.current_path).to eq "/users/new"
    end
  end

  feature "Search user", js: true do
    scenario "finds a user by first_name, last_name or email" do
      pending "capybara not firing ajax"

      fill_in "search", with: "alice"
      wait_for_ajax
      expect(page).to have_content "#{alice.decorate.full_name}"
      expect(page).not_to have_content "#{bob.decorate.full_name}"
    end
  end

  feature "action links" do
    context "delete" do
      scenario "deletes a user" do
        pending
        expect(page).to have_content "#{alice.decorate.full_name}"
        expect(page).to have_content "#{bob.decorate.full_name}"
        find(:linkhref, user_path(alice)).click
        expect(page).not_to have_content "#{alice.decorate.full_name}"
        expect(page).to have_content "#{bob.decorate.full_name}"
      end
    end

  end

end
