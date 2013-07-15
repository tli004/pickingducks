class UserMailer < ActionMailer::Base
  default :from => "webmaster@pickingducks.com"
  
  def registration_confirmation(user)
    @user = user
    mail(:to => "#{user.username} <#{user.email}>", :subject => "Registered!")
  end
  
  def password_reset(user)
    @user = user
    mail :to => user.email, :subject => "Password Reset"
  end
end
