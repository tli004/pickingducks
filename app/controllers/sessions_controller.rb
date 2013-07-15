class SessionsController < ApplicationController
  def new
  end
  
  def create
    user = User.find_by_email(params[:email])
    if user && User.authenticate(params[:email], params[:password])
      if params[:remember_me]
        cookies.permanent[:auth_token] = user.auth_token
      else
        cookies[:auth_token] = user.auth_token
      end
      flash.notice = "Logged in!"
      redirect_to root_url
    else 
      flash.alert = "Invalid email or password"
      redirect_to root_url
    end
  end
  
  def destroy
    cookies.delete(:auth_token)
    flash.notice = "Logged Out!"
    redirect_to root_url
  end
end
