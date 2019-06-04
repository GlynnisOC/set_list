require "rails_helper"

RSpec.describe "User visits awards index page" do
  context "as admin" do
    it "I can see a form to create a new award name on that same page" do
      admin = User.create(username: "penelope",
                         password: "boom",
                         role: 1)

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)
      visit admin_awards_path

      expect(page).to have_button 'Create New Award'

      fill_in "Name", with: "This Band Sucks"
      click_on 'Create New Award'

      expect(current_path).to eq(awards_path)
      expect(page).to have_content("This Band Sucks")
    end
  end

  context "as a regular user" do
    it "I cannot see the new award form" do
      user = User.create(username: "Adam", password: "password")

      visit awards_path

      expect(page).to_not have_content 'Create New Award'
    end
  end
end

# As an unregistered user,
#   When I visit the awards index, '/awards'
#     I cannot see the admin-only form to create new awards,
#     I see all awards
#     Each award should be a link to that award's specific show page.
#
# (for testing purposes, I should see at least 2 awards on the page)
# (testing should specifically check for absense of the form)
