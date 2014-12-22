require "rails_helper"

RSpec.describe Authentication::LoginWithOmniAuth do
  let(:params) do
    {
      :auth => {
        :provider => "github",
        :uid      => "12345",
        :info => {
          :nickname => "andypike",
          :name     => "Andy Pike",
          :image    => "https://avatars.githubusercontent.com/u/117697?v=3"
        }
      }
    }
  end

  subject(:operation) { Authentication::LoginWithOmniAuth.run(params).second }

  describe "validation" do
    it "is valid with valid params" do
      expect(operation).to be_valid
    end

    describe "auth.provider" do
      it "can't be blank" do
        params[:auth].delete(:provider)

        expect(operation).not_to be_valid
      end
    end

    describe "auth.uid" do
      it "can't be blank" do
        params[:auth].delete(:uid)

        expect(operation).not_to be_valid
      end
    end

    describe "auth.info.nickname" do
      it "can't be blank" do
        params[:auth][:info].delete(:nickname)

        expect(operation).not_to be_valid
      end
    end

    describe "auth.info.name" do
      it "can't be blank" do
        params[:auth][:info].delete(:name)

        expect(operation).not_to be_valid
      end
    end

    describe "auth.info.image" do
      it "can't be blank" do
        params[:auth][:info].delete(:image)

        expect(operation).not_to be_valid
      end
    end
  end

  describe "loading the user" do
    context "when the user hasn't authenticated before" do
      it "creates a new user" do
        expect(operation.user).to be_persisted
      end

      it "populates the user" do
        expect(operation.user).to have_attributes(
          :uid       => "12345",
          :provider  => "github",
          :nickname  => "andypike",
          :name      => "Andy Pike",
          :image_url => "https://avatars.githubusercontent.com/u/117697?v=3",
          :role      => "viewer"
        )
      end
    end

    context "when the user has authenticated before" do
      it "returns the existing user" do
        user = create(:user, :uid => "12345", :provider => "github")

        expect(operation.user).to eq(user)
      end
    end
  end
end
