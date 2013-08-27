class CashoutsController < ApplicationController
  def create
    cashout = current_user.cashouts.build(params[:cashout])
    
    if cashout.amount <= current_user.money && cashout.save
      current_user.money -= cashout.amount
      current_user.save
      flash[:notice]  = "Your cashout request has been received! Thank you so much."
      redirect_to user_path(current_user)
    else
      flash[:error] = "There was a problem processing your cashout request. You may want to try again."
      redirect_to "/request_cashout"
    end
    
  end
end
