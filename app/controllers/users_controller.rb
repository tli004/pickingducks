require 'will_paginate'

class UsersController < ApplicationController
  helper_method :sort_column, :sort_direction
  
  def request_cashout
    @cashout = Cashout.new
  end
  
  def buy_ducks
    begin
      charge = Stripe::Charge.create(
        :amount => 5 * params[:amount].to_i,
        :currency => "usd",
        :card => params[:stripe_card_token],
        :description => current_user.email
      )
      logger.info "BUY DUCK CHARGE WAS MADE. RECEIPT TOKEN: " + charge.id
      current_user.bankroll += params[:amount].to_i
      purchase = current_user.purchases.build
      purchase.stripe_payment_token = charge.id
      purchase.amount = params[:amount].to_i
      current_user.save
      flash[:notice] = "Your ducks have been purchased and added to your bankroll!"
      redirect_to user_path(current_user)
    rescue Stripe::CardError => e
      flash[:error] = "There was a problem processing your credit card information."
      redirect_to user_path(current_user)
    end
  end
  
  def buy_bet_info
    begin
      charge = Stripe::Charge.create(
        :amount => params[:amount].to_i,
        :currency => "usd",
        :card => params[:stripe_card_token],
        :description => current_user.email
      )
      logger.info "BUY BET INFO CHARGE WAS MADE. RECEIPT TOKEN: " + charge.id
      current_user.bankroll += params[:amount].to_i
      purchase = current_user.purchases.build
      purchase.stripe_payment_token = charge.id
      purchase.amount = params[:amount].to_i
      purchase.bet_id = params[:bet_id]
      current_user.save
      flash[:notice] = "Your credit card has been charged, and you can now see the bet information you purchased."
      redirect_to user_path(current_user)
    rescue Stripe::CardError => e
      flash[:error] = "There was a problem processing your credit card information."
      redirect_to user_path(current_user)
    end
  end
  
  def show
    @pending_bets = current_user.bets.where(:pending => true, :parlay => false)
    @parlays = current_user.parlays.where(:pending => true)
       
    @past_straights = current_user.bets.where(:pending => false, :parlay => false).order('closed_at').reverse
    @past_twenty = current_user.bets.where(:pending => false, :parlay => false).order('closed_at DESC').limit(20)
    
    @past_parlays = current_user.parlays.where(:pending => false).order('closed_at').reverse
        
    @nfl_past_bets = current_user.bets.where(:pending => false, :sport => 1, :parlay => false).order('closed_at').reverse
    @nfl_change_dates = @nfl_past_bets.map(&:closed_at).map {|date| date.strftime('%b')}
    @nba_past_bets = current_user.bets.where(:pending => false, :sport => 2, :parlay => false).order('closed_at').reverse   
    @nba_change_dates = @nba_past_bets.map(&:closed_at).map {|date| date.strftime('%b')}
    @mlb_past_bets = current_user.bets.where(:pending => false, :sport => 3, :parlay => false).order('closed_at').reverse    
    @mlb_change_dates = @mlb_past_bets.map(&:closed_at).map {|date| date.strftime('%b')}
    @nhl_past_bets = current_user.bets.where(:pending => false, :sport => 4, :parlay => false).order('closed_at').reverse
    @nhl_change_dates = @nhl_past_bets.map(&:closed_at).map {|date| date.strftime('%b')}
        
    @straight_change_dates = @past_straights.map(&:closed_at).map {|date| date.strftime('%b')}       
    @parlay_change_dates = @past_parlays.map(&:closed_at).map {|date| date.strftime('%b')}
    @bankroll_history.to_json.html_safe
    @change_hash = @change_hash.to_json.html_safe
    
    @bet_sales = []
    current_user.bets.order('created_at ASC').each do |bet|
      @bet_sales << bet.purchases
      @bet_sales.flatten!
      if @bet_sales.length >= 10
        break;
      end
    end    
    
    @rank = User.where('bankroll > ?', current_user.bankroll).count + 1
    
    @past_week_earnings_straight = current_user.past_week_earnings_straight
    @past_week_earnings_nfl = current_user.past_week_earnings_nfl
    @past_week_earnings_nba = current_user.past_week_earnings_nba
    @past_week_earnings_mlb = current_user.past_week_earnings_mlb
    @past_week_earnings_nhl = current_user.past_week_earnings_nhl
    
  end
  
  def public_profile
    @user = User.find(params[:id])    
    
    @pending_bets = @user.bets.where(:pending => true, :parlay => false)
    
    @past_straights = @user.bets.where(:pending => false, :parlay => false).order('closed_at ASC')
    @past_parlays = @user.parlays.where(:pending => false).order('closed_at ASC')        
    
    @nfl_past_bets = @user.bets.where(:pending => false, :sport => 1, :parlay => false).order('closed_at ASC')
    @nfl_change_dates = @nfl_past_bets.map(&:closed_at).map {|date| date.strftime('%b')}
    @nba_past_bets = @user.bets.where(:pending => false, :sport => 2, :parlay => false).order('closed_at ASC')   
    @nba_change_dates = @nba_past_bets.map(&:closed_at).map {|date| date.strftime('%b')}
    @mlb_past_bets = @user.bets.where(:pending => false, :sport => 3, :parlay => false).order('closed_at ASC')    
    @mlb_change_dates = @mlb_past_bets.map(&:closed_at).map {|date| date.strftime('%b')}
    @nhl_past_bets = @user.bets.where(:pending => false, :sport => 4, :parlay => false).order('closed_at ASC')
    @nhl_change_dates = @nhl_past_bets.map(&:closed_at).map {|date| date.strftime('%b')}    
    
    @straight_change_dates = @past_straights.map(&:closed_at).map {|date| date.strftime('%b')}       
    @parlay_change_dates = @past_parlays.map(&:closed_at).map {|date| date.strftime('%b')}
    @bankroll_history.to_json.html_safe
    @change_hash = @change_hash.to_json.html_safe
    
    @past_week_earnings_straight = @user.past_week_earnings_straight
    @past_week_earnings_nfl = @user.past_week_earnings_nfl
    @past_week_earnings_nba = @user.past_week_earnings_nba
    @past_week_earnings_mlb = @user.past_week_earnings_mlb
    @past_week_earnings_nhl = @user.past_week_earnings_nhl
    
    @rank = User.where('bankroll > ?', current_user.bankroll).count + 1
  end
    
  
  def pay_for_bet
    bet = Bet.find(params[:bet_id])
    user = User.find(params[:user_id])
    
    if bet.duck_price <= current_user.bankroll
      current_user.bankroll -= bet.duck_price
      purchase = current_user.purchases.build
      purchase.bet = bet
      user.bankroll += bet.duck_price
      
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
  
  def pay_money_for_bet
    @bet = Bet.find(params[:bet_id])
    @user = User.find(params[:user_id])    
  end
  
  def new
  end
  
  def register
    
  end
  
  def update
    current_user.update_attributes(params[:user])
    flash[:notice] = "Account details updated!"
    redirect_to :action => 'show'
  end
  
  def create
    @user = User.new(params[:user])
    @user.email = params[:user][:email].downcase
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
