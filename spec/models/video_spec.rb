require "rails_helper"

RSpec.describe Video do
  describe ".latest" do
    subject { Video.latest }

    it "returns only published videos" do
      create(:video, :status => "published")
      create(:video, :status => "pending")

      expect(subject).to have(1).item
      expect(subject.first).to be_published
    end

    it "orders videos by most recent" do
      first  = create(:video)
      second = create(:video)

      expect(subject).to eq([second, first])
    end
  end
end
