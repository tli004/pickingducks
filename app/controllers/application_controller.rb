class ApplicationController < ActionController::Base
  protect_from_forgery
  helper_method :current_user  

  def how_to_play
    @user = User.new
  end
  
  def privacy    
  end
  
  def terms_of_service
  end
    
  private
  
  def current_user
    @current_user ||= User.find_by_auth_token(cookies[:auth_token]) if cookies[:auth_token]
  end
end
