class SessionsController < ApplicationController
  include Trailblazer::Operation::Controller

  def create
    run Authentication::LoginWithOmniAuth do |op|
      session[:user_id] = op.user.id
      return redirect_to root_path, :notice => "Successfully logged in!"
    end
  end

  private

  def process_params!(params)
    params.merge!(
      :auth => env["omniauth.auth"]
    )
  end
end
