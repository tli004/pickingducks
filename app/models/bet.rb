class Bet < ActiveRecord::Base
  belongs_to :user
  belongs_to :event
  attr_accessible :amount, :bet_home, :over_under, :bet, :event_id, :user_id, :parlay, :pending, :winning, :finished_at, :resulting_bankroll
  
  scope :get_pending, where(:pending => true) 
  
  def won?
    true
  end
  
  def self.close_bets
    logger.info "Closing Bets!!!!!!!!!!!!!!!!!!!!!!!!" 
    get_pending.each do |bet|
      if bet.event.finished?
        user = bet.user
        
        if bet.won?
          user.bankroll += bet.amount
          user.save
          bet.resulting_bankroll = user.bankroll
          bet.winning = true
        else
          user.bankroll -= bet.amount
          user.save
          bet.resulting_bankroll = user.bankroll
          bet.winning = false
        end
        
        bet.pending = false
        bet.finished_at = Time.now.to_date
        
        bet.save
      end
    end
  end
  
end
