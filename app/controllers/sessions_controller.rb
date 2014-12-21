class SessionsController < ApplicationController
  include Trailblazer::Operation::Controller

  def create
    run Authentication::LoginWithOmniAuth, auth do |op|
      return redirect_to root_path, :notice => "Successfully logged in!"
    end
  end

  private

  def auth
    env["omniauth.auth"]
  end
end
