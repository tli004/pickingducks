class BetsController < ApplicationController

  def new
    @bet = Bet.new
    @event = Event.find(params[:event_id])    
  end
  
  def create
    event = Event.find(params[:event_id])    
    
    if params[:bet][:amount].to_i < current_user.bankroll
      bet = Bet.new(params[:bet])
      if bet.save
        current_user.bets << bet        
        current_user.bankroll = current_user.bankroll - params[:bet][:amount].to_i
        current_user.save
        event.bets << bet
        event.save
        flash.notice = "Your bet has been placed! Good luck!!"
        redirect_to Rails.application.routes.url_helpers.user_path(current_user.id) 
      end 
    else
      flash.alert = "This bet exceeds your current bankroll of Ducks!"
      redirect_to 'new'
    end  
  end
  
  def add_bets_to_parlay
    parlay = current_user.parlays.build
    parlay.amount = params[:amount]
    params[:event_id].each do |event|
      bet = parlay.bets.build
      bet.update_attributes({:event_id => event, :amount => params[:amount], :parlay => true})
      if !parlay.save
        flash[:error] = "An error occured while creating your parlay"
        return redirect_to '/bets_home'
      end
    end
    
    flash[:notice] = "Your parlay bet has been placed!"
    redirect_to '/bets_home'
  end
  
  def bets_home
    @games = Event.where('start_time > ? and start_time < ?', Time.now.to_date, 7.days.from_now.to_date).order("sport ASC")
    @sport = 0
  end
  
  def make_parlay
    @games = Event.where('start_time > ? and start_time < ?', Time.now.to_date, 7.days.from_now.to_date).order("sport ASC")
    @sport = 0 # used to set headers in parlay_select_table
  end

end
