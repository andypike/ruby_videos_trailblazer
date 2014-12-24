require "rails_helper"

RSpec.describe "Adding a video" do
  context "when logged in as an admin" do
    before do
      create   :presenter
      login_as :admin
      click_on "Add Video"
    end

    context "with valid data" do
      let(:thumbnail) { File.expand_path("spec/support/files/thumbnail.png") }
      let(:video)     { Video.last }

      it "allows new videos to be added" do
        fill_in "Title",         :with => "A great ruby video"
        select  "Andy Pike",     :from => "Presenter"
        fill_in "Original date", :with => "31/01/2014"
        fill_in "Original url",  :with => "http://youtube.com/1234567"
        select  "You Tube",      :from => "Host"
        fill_in "Embed url",     :with => "http://youtube.com/embed/1234567"
        select  "Published",     :from => "Status"
        attach_file "Thumbnail", thumbnail

        expect {
          click_on "Save"
        }.to change(Video, :count).by(1)
        expect(page).to have_content(/successfully added/i)
        expect(video.thumbnail).to be_present
      end
    end

    context "with invalid data" do
      it "displays errors" do
        expect {
          click_on "Save"
        }.not_to change(Video, :count)
        expect(page).to have_content("can't be blank")
      end
    end
  end

  context "when logged in as a viewer" do
    it "doesn't show the add video link" do
      login_as :viewer

      expect(page).not_to have_link("Add Video")
    end

    it "disallows direct access" do
      login_as :viewer
      visit new_video_path

      expect(page).to have_content(/access denied/i)
    end
  end

  context "when not logged in" do
    it "doesn't show the add video link" do
      visit root_path

      expect(page).not_to have_link("Add Video")
    end

    it "disallows direct access" do
      visit new_video_path

      expect(page).to have_content(/access denied/i)
    end
  end
end
