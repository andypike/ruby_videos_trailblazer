class SessionsController < ApplicationController
  def create
    run Authentication::LoginWithOmniAuth do |op|
      login(op.user)
      return redirect_to root_path, :notice => "Successfully logged in!"
    end
  end

  def destroy
    logout
    redirect_to root_path, :notice => "Successfully logged out!"
  end

  private

  def process_params!(params)
    params.merge!(
      :auth => env["omniauth.auth"]
    )
  end
end
