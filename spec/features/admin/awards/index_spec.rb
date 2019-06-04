require "rails_helper"

RSpec.describe "User visits awards index page" do
  context "as admin" do
    before :each do
      admin = User.create(username: "penelope",
                         password: "boom",
                         role: 1)

       allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)
    end

    it "I can see a form to create a new award name on that same page" do
      visit admin_awards_path

      expect(page).to have_button 'Create New Award'
    end
  end
end
