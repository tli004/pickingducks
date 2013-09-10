class BetsController < ApplicationController

  def new
    @bet = Bet.new
    @event = Event.find(params[:event_id])    
  end
  
  def create
    @event = Event.find(params[:event_id])    
    
    if params[:bet][:amount].to_i <= current_user.bankroll
      bet = Bet.new(params[:bet])
      if bet.save
        current_user.bets << bet        
        current_user.bankroll = current_user.bankroll - params[:bet][:amount].to_i
        current_user.save
        update_current_user
        @event.bets << bet
        @event.save
        flash.notice = "Your bet has been placed! Good luck!!"
        redirect_to Rails.application.routes.url_helpers.user_path(current_user.id) 
      else       
        flash[:error] = bet.errors.full_messages.collect { |msg| msg + "<br/>" }.join
        @bet = Bet.new
        render :action => 'new'
      end 
    else
      flash[:alert] = "This bet exceeds your current bankroll of Ducks!"
      redirect_to 'new'
    end  
  end
  
  def add_bets_to_parlay
    parlay = current_user.parlays.build
    parlay.amount = params[:amount]
    parlay.pending = true
    params[:event_id].each do |event|
      bet = parlay.bets.build
      if params[:sport][event][0]
        bet.update_attributes({:event_id => event, :amount => params[:amount], :bet_type => params[:bet_type][event], :sport => params[:sport][event][0], :parlay => true})
      else
        bet.update_attributes({:event_id => event, :amount => params[:amount], :bet_type => params[:bet_type][event], :sport => params[:sport][event][1], :parlay => true})
      end      
    end
    
    if parlay.save
      current_user.save
      update_current_user
      flash[:notice] = "Your parlay bet has been placed!"
      redirect_to '/bets_home'
    else
      flash[:error] = "An error occured while creating your parlay"
      return redirect_to '/bets_home'
    end
    
  end
  
  def bets_home
    @games = Event.where('start_time > ? and start_time < ?', Time.zone.now.to_date, 7.days.from_now.to_date).order("sport ASC")
    @sport = 0
  end
  
  def make_parlay
    @games = Event.where('start_time > ? and start_time < ?', Time.zone.now.to_date, 7.days.from_now.to_date).order("sport ASC")
    @sport = 0 # used to set headers in parlay_select_table
  end
  
  def make_bet_private
    bet = Bet.find(params[:id])
    
    if bet.update_attributes params[:bet]
      if params[:bet][:duck_price]
        flash[:notice] = "Bet has been made purchaseable for #{bet.duck_price} ducks!"        
      else 
        flash[:notice] = "Bet has been made purchaseable for #{bet.money_price} dollars!"     
      end
      redirect_to user_path current_user.id        
    else
      flash[:alert] = "An error occured."
      redirect_to root_path
    end    
  end

end
