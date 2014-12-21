module Authentication
  class LoginWithOmniAuth < Trailblazer::Operation
    attr_reader :user

    def model
      user
    end

    contract do
      property :uid,        :validates => { :presence => true }
      property :provider,   :validates => { :presence => true }

      property :info do
        property :name,     :validates => { :presence => true }
        property :nickname, :validates => { :presence => true }
        property :image,    :validates => { :presence => true }
      end
    end

    def process(params)
      validate(params[:auth], OmniAuthBasics.new) do |auth|
        load_user_from(auth)
      end
    end

    private

    def load_user_from(auth)
      uid_and_provider = { :uid => auth.uid, :provider => auth.provider }

      @user = User.find_or_create_by(uid_and_provider) do |u|
        u.name      = auth.info.name
        u.nickname  = auth.info.nickname
        u.image_url = auth.info.image
      end
    end
  end
end
