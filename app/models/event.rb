class Event < ActiveRecord::Base
  has_many :bets
  
  attr_accessible :sport, :spread, :total_points, :start_time, :live, :finished, :home_team, :away_team, :extern_id
  
end
