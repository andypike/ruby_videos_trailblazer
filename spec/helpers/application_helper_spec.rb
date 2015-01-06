require "rails_helper"

RSpec.describe ApplicationHelper do
  describe "#smooth_link_to" do
    subject { helper.smooth_link_to("Contact Us", "contact") }

    context "when on the homepage" do
      before { allow(helper).to receive(:controller_name) { "home" } }

      it "generates link with href only containing the anchor" do
        expect(subject).to eq('<a class="scroll-smooth" href="#contact">Contact Us</a>')
      end
    end

    context "when not on the homepage" do
      before { allow(helper).to receive(:controller_name) { "videos" } }

      it "generates link with href containing the root path and anchor" do
        expect(subject).to eq('<a class="scroll-smooth" href="/#contact">Contact Us</a>')
      end
    end
  end
end
