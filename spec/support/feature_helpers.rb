module FeatureHelpers
  def login_as(user)
    user = create(user)

    visit root_path
    click_on "Login with GitHub"
  end
end
