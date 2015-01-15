require "rails_helper"

RSpec.describe Video::Create do
  let(:params) do
    {
      :video => {
        :title        => "A Title",
        :presenter_id => "1",
        :original_url => "http://url.com",
        :host         => "you_tube",
        :embed_url    => "http://url.com/embed",
        :status       => "published",
        :originally_posted_on => "31/01/2015"
      },
      :current_user => build(:admin)
    }
  end

  subject(:operation) { Video::Create.run(params).second }

  describe "validation" do
    it "is valid with valid params" do
      expect(operation).to be_valid
    end

    %i(
      title
      presenter_id
      original_url
      embed_url
      originally_posted_on
    ).each do |attribute|
      describe "video.#{attribute}" do
        it "can't be blank" do
          params[:video].delete(attribute)

          expect(operation).not_to be_valid
        end
      end
    end
  end

  describe "creating the video" do
    context "as a user with permission" do
      it "creates a new video" do
        expect(operation.video).to be_persisted
      end
    end

    context "as a user without permission" do
      before { params[:current_user] = GuestUser.new }

      it "does not complete" do
        expect do
          Video::Create.run(params)
        end.to raise_error(CanCan::AccessDenied)
      end
    end
  end
end
