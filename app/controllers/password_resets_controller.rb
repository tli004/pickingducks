class PasswordResetsController < ApplicationController
  def new
    @user = User.new
  end
  
  def create
    user = User.find_by_email(params[:email])
    user.send_password_reset if user
    flash[:notice] = "Email sent with password reset instructions."
    redirect_to root_url
  end
  
  def edit
    @user = User.find_by_password_reset_token!(params[:id])
  end
  
  def update
    @user = User.find_by_password_reset_token!(params[:id])
    if @user.password_reset_sent_at < 2.hours.ago
      flash[:alert] = "Password reset has expired!"
      redirect_to new_password_reset_path
    elsif @user.update_attributes(params[:user])
      flash[:notice] = "Password has been reset!"
      redirect_to root_url
    else
      flash[:alert] = "Unable to reset password."
      render :edit
    end
  end
end
