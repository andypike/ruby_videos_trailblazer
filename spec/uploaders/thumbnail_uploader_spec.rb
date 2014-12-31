require "rails_helper"

RSpec.describe ThumbnailUploader do
  include CarrierWave::Test::Matchers

  let(:video) { create(:video) }
  subject     { ThumbnailUploader.new(video, :thumbnail) }

  before { subject.store!(File.open(image_path)) }

  context "image is larger than required" do
    let(:image_path) { support_file("500x500.gif") }

    it "scales down to 400 by 300 pixels" do
      expect(subject).to have_dimensions(400, 300)
    end
  end

  context "image is smaller than required" do
    let(:image_path) { support_file("100x100.gif") }

    it "scales up to 400 by 300 pixels" do
      expect(subject).to have_dimensions(400, 300)
    end
  end
end
