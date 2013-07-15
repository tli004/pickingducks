# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Event.create(:sport => 1, :start_time => Time.now.to_date, :home_team => "Colts", :away_team => "Patriots", :spread => 12, :total_points => 105)
Event.create(:sport => 1, :start_time => Time.now.to_date, :home_team => "Browns", :away_team => "Ravens", :spread => -12, :total_points => 90)
Event.create(:sport => 1, :start_time => Time.now.to_date, :home_team => "Titans", :away_team => "Raiders", :spread => 3, :total_points => 55)
Event.create(:sport => 1, :start_time => Time.now.to_date, :home_team => "Bengals", :away_team => "Chargers", :spread => -7, :total_points => 75)
Event.create(:sport => 1, :start_time => Time.now.to_date, :home_team => "Bears", :away_team => "Dolphins", :spread => -6.5, :total_points => 36)
Event.create(:sport => 1, :start_time => Time.now.to_date, :home_team => "Giants", :away_team => "Saints", :spread => 13.5, :total_points => 88)

Event.create(:sport => 2, :start_time => 1.days.from_now.to_date, :home_team => "Lakers", :away_team => "Celtics", :spread => 4, :total_points => 210)
Event.create(:sport => 2, :start_time => 1.days.from_now.to_date, :home_team => "Suns", :away_team => "Thunder", :spread => -12, :total_points => 199)
Event.create(:sport => 2, :start_time => 1.days.from_now.to_date, :home_team => "Jazz", :away_team => "Nets", :spread => -3, :total_points => 185)
Event.create(:sport => 2, :start_time => 1.days.from_now.to_date, :home_team => "Spurs", :away_team => "Rockets", :spread => 15, :total_points => 190)
Event.create(:sport => 2, :start_time => 1.days.from_now.to_date, :home_team => "Heat", :away_team => "Grizzlies", :spread => 12, :total_points => 170)
Event.create(:sport => 2, :start_time => 1.days.from_now.to_date, :home_team => "Raptors", :away_team => "Cavaliers", :spread => 2, :total_points => 175)

Event.create(:sport => 3, :start_time => 2.days.from_now.to_date, :home_team => "Orioles", :away_team => "Diamondbacks", :spread => 1, :total_points => 4)
Event.create(:sport => 3, :start_time => 2.days.from_now.to_date, :home_team => "Indians", :away_team => "Rockies", :spread => -2, :total_points => 7)
Event.create(:sport => 3, :start_time => 2.days.from_now.to_date, :home_team => "Tigers", :away_team => "Reds", :spread => 3, :total_points => 2)
Event.create(:sport => 3, :start_time => 2.days.from_now.to_date, :home_team => "Angels", :away_team => "Mariners", :spread => -0.5, :total_points => 5.5)
Event.create(:sport => 3, :start_time => 2.days.from_now.to_date, :home_team => "Rangers", :away_team => "Cardinals", :spread => 0.5, :total_points => 9)
Event.create(:sport => 3, :start_time => 2.days.from_now.to_date, :home_team => "Giants", :away_team => "Athletics", :spread => 3, :total_points => 10)

Event.create(:sport => 4, :start_time => 3.days.from_now.to_date, :home_team => "Ducks", :away_team => "Blackhawks", :spread => 2, :total_points => 2)
Event.create(:sport => 4, :start_time => 3.days.from_now.to_date, :home_team => "Avalanche", :away_team => "Red Wings", :spread => -1, :total_points => 5)
Event.create(:sport => 4, :start_time => 3.days.from_now.to_date, :home_team => "Maple Leaves", :away_team => "Canadians", :spread => 3, :total_points => 5)
Event.create(:sport => 4, :start_time => 3.days.from_now.to_date, :home_team => "Predators", :away_team => "Flyers", :spread => -0.5, :total_points => 2)
Event.create(:sport => 4, :start_time => 3.days.from_now.to_date, :home_team => "Blues", :away_team => "Sharks", :spread => -1, :total_points => 3)
Event.create(:sport => 4, :start_time => 3.days.from_now.to_date, :home_team => "Jets", :away_team => "Capitals", :spread => 1.5, :total_points => 2)

Bet.create(:event_id => 1, :user_id => 1, :amount => 5, :bet => "home", :parlay => false, :pending => false, :winning => true, :finished_at => 10.day.ago, :resulting_bankroll => 105)
Bet.create(:event_id => 1, :user_id => 1, :amount => 5, :bet => "home", :parlay => false, :pending => false, :winning => true, :finished_at => 9.day.ago, :resulting_bankroll => 110)
Bet.create(:event_id => 1, :user_id => 1, :amount => 5, :bet => "home", :parlay => false, :pending => false, :winning => true, :finished_at => 8.day.ago, :resulting_bankroll => 115)
Bet.create(:event_id => 1, :user_id => 1, :amount => 5, :bet => "home", :parlay => false, :pending => false, :winning => false, :finished_at => 7.day.ago, :resulting_bankroll => 110)
Bet.create(:event_id => 1, :user_id => 1, :amount => 5, :bet => "home", :parlay => false, :pending => false, :winning => true, :finished_at => 6.day.ago, :resulting_bankroll => 115)
Bet.create(:event_id => 1, :user_id => 1, :amount => 5, :bet => "home", :parlay => false, :pending => false, :winning => true, :finished_at => 5.day.ago, :resulting_bankroll => 120)
Bet.create(:event_id => 1, :user_id => 1, :amount => 5, :bet => "home", :parlay => false, :pending => false, :winning => true, :finished_at => 4.day.ago, :resulting_bankroll => 125)
Bet.create(:event_id => 1, :user_id => 1, :amount => 10, :bet => "home", :parlay => false, :pending => false, :winning => true, :finished_at => 3.day.ago, :resulting_bankroll => 135)
Bet.create(:event_id => 1, :user_id => 1, :amount => 5, :bet => "home", :parlay => false, :pending => false, :winning => false, :finished_at => 2.day.ago, :resulting_bankroll => 130)
Bet.create(:event_id => 1, :user_id => 1, :amount => 5, :bet => "home", :parlay => false, :pending => false, :winning => true, :finished_at => 1.day.ago, :resulting_bankroll => 135)

Bet.create(:event_id => 2, :user_id => 1, :amount => 5, :bet => "home", :parlay => false, :pending => true)
Bet.create(:event_id => 2, :user_id => 1, :amount => 5, :bet => "home", :parlay => false, :pending => true)
Bet.create(:event_id => 2, :user_id => 1, :amount => 5, :bet => "home", :parlay => false, :pending => true)
Bet.create(:event_id => 2, :user_id => 1, :amount => 5, :bet => "home", :parlay => false, :pending => true)
Bet.create(:event_id => 2, :user_id => 1, :amount => 5, :bet => "home", :parlay => false, :pending => true)
Bet.create(:event_id => 2, :user_id => 1, :amount => 5, :bet => "home", :parlay => false, :pending => true)
Bet.create(:event_id => 2, :user_id => 1, :amount => 5, :bet => "home", :parlay => false, :pending => true)
Bet.create(:event_id => 2, :user_id => 1, :amount => 10, :bet => "home", :parlay => false, :pending => true)
Bet.create(:event_id => 2, :user_id => 1, :amount => 5, :bet => "home", :parlay => false, :pending => true)
Bet.create(:event_id => 2, :user_id => 1, :amount => 5, :bet => "home", :parlay => false, :pending => true)


User.create(:username => "cdub", :password => "dinner", :email => "cwood32k@gmail.com", :first_name => "Chris", :last_name => "Wood", :wins => 10, :losses => 10, :ties => 1, :bankroll => 200)
