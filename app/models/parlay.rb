class Parlay < ActiveRecord::Base
  belongs_to :user
  has_many :bets
  
  attr_accessible :amount
end
