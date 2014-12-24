class ApplicationController < ActionController::Base
  include Trailblazer::Operation::Controller

  protect_from_forgery :with => :exception
  helper_method :current_user

  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_url, :alert => "Access denied. You do not have permission to do that."
  end

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
