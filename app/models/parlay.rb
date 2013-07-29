class Parlay < ActiveRecord::Base
  belongs_to :user
  has_many :bets
  
  attr_accessible :amount, :user_id, :winning, :resulting_bankroll, :finished_at, :pending
end
