module Authentication
  class OmniAuthBasics
    attr_accessor :uid, :provider, :info

    def initialize
      @info = UserInfo.new
    end
  end
end
