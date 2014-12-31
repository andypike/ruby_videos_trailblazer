require "rails_helper"

RSpec.describe "Homepage" do
  it "is visible" do
    visit root_path

    expect(page).to have_content(/ruby videos/i)
  end

  it "shows the latest videos" do
    create_list(:video, 3)
    visit root_path

    expect(page).to have_css(".video", :count => 3)
  end
end
