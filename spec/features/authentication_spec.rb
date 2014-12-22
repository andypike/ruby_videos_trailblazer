require "rails_helper"

RSpec.describe "Authentication" do
  before { visit root_path }

  describe "Logging in via GitHub" do
    it "shows a success message" do
      click_on "Login with GitHub"

      expect(page).to have_content(/successfully logged in/i)
      expect(page).to have_content(/logged in as andypike/i)
    end

    context "when user authenticates for the first time" do
      it "creates a new user" do
        expect {
          click_on "Login with GitHub"
        }.to change(User, :count).by(1)
      end
    end

    context "when user authenticates subsequently" do
      it "doesn't create another user" do
        create(:user, :provider => "github", :uid => "12345")

        expect {
          click_on "Login with GitHub"
        }.not_to change(User, :count)
      end
    end
  end

  describe "Logging out" do
    it "allows logged in users to logout" do
      click_on "Login with GitHub"
      click_on "Logout"

      expect(page).to have_content(/successfully logged out/i)
    end

    it "doesn't show the logout link users not logged in" do
      expect(page).not_to have_link("Logout")
    end
  end
end
