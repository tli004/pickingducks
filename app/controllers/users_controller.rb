class UsersController < ApplicationController
  
  def show
    @pending_bets = current_user.bets.where(:pending => true, :parlay => false)
    @parlays = current_user.parlays
    @past_bets = current_user.bets.where(:pending => false).order('finished_at ASC')
    @bankroll_history = @past_bets.map(&:resulting_bankroll)
    @change_dates = @past_bets.map(&:finished_at)
    @change_dates = @change_dates.map {|date| date.strftime('%m-%d')}
    @change_hash = Hash.new
    @change_dates.each_with_index do |date, i|
      if i % 4 == 0
        @change_hash[i] = date
      end
    end
    
    @bankroll_history.to_json.html_safe
    @change_hash = @change_hash.to_json.html_safe
  end
  
  def new
    @user = User.new
  end
  
  def update
    current_user.update_attributes(params[:user])
    flash[:notice] = "Account details updated!"
    redirect_to :action => 'show'
  end
  
  def create
    @user = User.new(params[:user])
    @user.wins = 0
    @user.losses = 0
    @user.ties = 0
    @user.bankroll = 100.0
    
    if @user.save
      #UserMailer.registration_confirmation(@user).deliver
      session[:user_id] = @user.id
      flash.notice = "Signed up!"
      redirect_to root_url
    else
      logger.info @user.errors.full_messages
      flash.notice = "An error occured with sign up."
      redirect_to root_url
    end
  end
end
