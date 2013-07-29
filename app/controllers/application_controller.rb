class ApplicationController < ActionController::Base
  protect_from_forgery
  helper_method :current_user, :update_current_user

  def how_to_play
    @user = User.new
  end
  
  def privacy   
    @user = User.new 
  end
  
  def terms_of_service
    @user = User.new
  end
    
  private
  
  def current_user
    @current_user ||= User.find_by_auth_token(cookies[:auth_token]) if cookies[:auth_token]
  end
  
  def update_current_user
    @current_user = User.find_by_auth_token(cookies[:auth_token])
  end
end
