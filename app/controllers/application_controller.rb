class ApplicationController < ActionController::Base
  protect_from_forgery :with => :exception
  helper_method :current_user

  private

  def current_user
    if session[:user_id].present?
      @current_user ||= User.find_by(:id => session[:user_id])
    end

    @current_user || GuestUser.new
  end

  def login(user)
    session[:user_id] = user.id
  end

  def logout
    session[:user_id] = nil
  end
end
