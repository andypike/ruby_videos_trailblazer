require "rails_helper"

RSpec.describe "Adding a video" do
  context "when logged in as an admin" do
    it "allows new videos to be added" do
      login_as :admin

      click_on "Add Video"

      fill_in "Title",         :with => "A great ruby video"
      fill_in "Presenter",     :with => "Andy Pike"
      fill_in "Original date", :with => ""
      fill_in "Original url",  :with => "http://youtube.com/1234567"
      fill_in "Thumbnail",     :with => ""
      select  "YouTube",       :from => "Hosted by"
      fill_in "Embed url",     :with => "http://youtube.com/embed/1234567"
      select  "Published",     :from => "Status"

      expect {
        click_on "Save"
      }.to change(Video, :count).by(1)
      expect(page).to have_content(/successfully added/i)
    end
  end

  context "when logged in as a viewer" do
    it "doesn't show the add video link"
    it "disallows direct access"
  end

  context "when not logged in" do
    it "doesn't show the add video link"
    it "disallows direct access"
  end
end
