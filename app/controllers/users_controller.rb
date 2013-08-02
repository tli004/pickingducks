require 'will_paginate'

class UsersController < ApplicationController
  helper_method :sort_column, :sort_direction
  
  def show
    @pending_bets = current_user.bets.where(:pending => true, :parlay => false)
    @parlays = current_user.parlays.where(:pending => true)
       
    @past_straights = current_user.bets.where(:pending => false, :parlay => false).order('finished_at ASC')
    @past_parlays = current_user.parlays.where(:pending => false).order('finished_at ASC')
        
    @nfl_past_bets = current_user.bets.where(:pending => false, :sport => 1, :parlay => false).order('finished_at ASC')
    @nfl_change_dates = @nfl_past_bets.map(&:finished_at).map {|date| date.strftime('%b')}
    @nba_past_bets = current_user.bets.where(:pending => false, :sport => 2, :parlay => false).order('finished_at ASC')   
    @nba_change_dates = @nba_past_bets.map(&:finished_at).map {|date| date.strftime('%b')}
    @mlb_past_bets = current_user.bets.where(:pending => false, :sport => 3, :parlay => false).order('finished_at ASC')    
    @mlb_change_dates = @mlb_past_bets.map(&:finished_at).map {|date| date.strftime('%b')}
    @nhl_past_bets = current_user.bets.where(:pending => false, :sport => 4, :parlay => false).order('finished_at ASC')
    @nhl_change_dates = @nhl_past_bets.map(&:finished_at).map {|date| date.strftime('%b')}
        
    @straight_change_dates = @past_straights.map(&:finished_at).map {|date| date.strftime('%b')}       
    @parlay_change_dates = @past_parlays.map(&:finished_at).map {|date| date.strftime('%b')}
    @bankroll_history.to_json.html_safe
    @change_hash = @change_hash.to_json.html_safe
  end
  
  def public_profile
    @user = User.find(params[:id])    
    
    @pending_bets = @user.bets.where(:pending => true, :parlay => false)
    
    @past_straights = @user.bets.where(:pending => false, :parlay => false).order('finished_at ASC')
    @past_parlays = @user.parlays.where(:pending => false).order('finished_at ASC')        
    
    @nfl_past_bets = @user.bets.where(:pending => false, :sport => 1, :parlay => false).order('finished_at ASC')
    @nfl_change_dates = @nfl_past_bets.map(&:finished_at).map {|date| date.strftime('%b')}
    @nba_past_bets = @user.bets.where(:pending => false, :sport => 2, :parlay => false).order('finished_at ASC')   
    @nba_change_dates = @nba_past_bets.map(&:finished_at).map {|date| date.strftime('%b')}
    @mlb_past_bets = @user.bets.where(:pending => false, :sport => 3, :parlay => false).order('finished_at ASC')    
    @mlb_change_dates = @mlb_past_bets.map(&:finished_at).map {|date| date.strftime('%b')}
    @nhl_past_bets = @user.bets.where(:pending => false, :sport => 4, :parlay => false).order('finished_at ASC')
    @nhl_change_dates = @nhl_past_bets.map(&:finished_at).map {|date| date.strftime('%b')}    
    
    @straight_change_dates = @past_straights.map(&:finished_at).map {|date| date.strftime('%b')}       
    @parlay_change_dates = @past_parlays.map(&:finished_at).map {|date| date.strftime('%b')}
    @bankroll_history.to_json.html_safe
    @change_hash = @change_hash.to_json.html_safe
  end
    
  
  def pay_for_bet
    bet = Bet.find(params[:bet_id])
    user = User.find(params[:user_id])
    
    if bet.public_price <= current_user.bankroll
      current_user.bankroll -= bet.public_price
      purchase = current_user.purchases.build
      purchase.bet = bet
      user.bankroll += bet.public_price
      
      if current_user.save && user.save
          flash[:notice] = "Bet purchased!"
          return redirect_to public_profile_path(user.id)
      else
          flash[:error] = "An error occured.<br />"
          flash[:error] << user.errors.full_messages.collect { |msg| msg + "<br/>" }.join
          flash[:error] << current_user.errors.full_messages.collect { |msg| msg + "<br/>" }.join
          return redirect_to public_profile_path(user)
      end
    else
      flash[:alert] = "You do not have enough ducks to purchase this information"
      return redirect_to public_profile user
    end
    
    return redirect_to public_profile_path(user.id)  
  end
  
  def new
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
      cookies[:auth_token] = @user.auth_token
      flash.notice = "Signed up!"
      redirect_to root_url
    else
      logger.info @user.errors.full_messages
      flash[:error] = "An error occured with sign up.<br />"
      flash[:error] << @user.errors.full_messages.collect { |msg| msg + "<br/>" }.join
      redirect_to root_url
    end
  end
  
  def index
    @users = User.search(params[:search]).order(sort_column + " " + sort_direction).paginate(:per_page => 15, :page => params[:page])  
    params[:per_page] = 10  
  end
  
  private
  
  def sort_column
    User.column_names.include?(params[:sort]) ? params[:sort] : "bankroll"
  end
  
  def sort_direction
    %w[asc desc].include?(params[:direction]) ? params[:direction] : "desc"
  end
  
end
