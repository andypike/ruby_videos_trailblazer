OmniAuth.config.test_mode = true
OmniAuth.config.mock_auth[:github] = OmniAuth::AuthHash.new(
  :provider => "gihub",
  :uid      => "123545",
  :info => {
    :nickname => "andypike",
    :name     => "Andy Pike",
    :image    => "https://avatars.githubusercontent.com/u/117697?v=3"
  }
)

RSpec.configure do |config|
  config.before(:each) do
    OmniAuth.config.mock_auth[:github] = nil
  end
end
