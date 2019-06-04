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
      award_1 = Award.create(name: 'Wow')
      award_2 = Award.create(name: 'Cool')

      visit awards_path

      expect(page).to_not have_content 'Create New Award'

      expect(page).to have_content("#{award_1.name}")
      expect(page).to have_content("#{award_2.name}")

      click_on "#{award_1.name}"
      expect(current_path).to eq(award_path(award_1))

      visit awards_path

      click_on "#{award_2.name}"
      expect(current_path).to eq(award_path(award_2))

    end
  end
end
