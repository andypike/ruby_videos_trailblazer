require "rails_helper"

RSpec.describe "Homepage" do
  it "is visible" do
    visit root_path

    expect(page).to have_content(/ruby videos/i)
  end
end
