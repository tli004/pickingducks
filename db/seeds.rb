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

Bet.create(:event_id => 1, :user_id => 1, :sport => 1, :public_price => -1, :amount => 5, :bet_type => "home", :parlay => false, :pending => false, :winning => true, :finished_at => 10.day.ago, :resulting_bankroll => 105)
Bet.create(:event_id => 2, :user_id => 1, :sport => 1, :public_price => -1, :amount => 5, :bet_type => "home", :parlay => false, :pending => false, :winning => true, :finished_at => 9.day.ago, :resulting_bankroll => 110)
Bet.create(:event_id => 3, :user_id => 1, :sport => 1, :public_price => -1, :amount => 5, :bet_type => "home", :parlay => false, :pending => false, :winning => true, :finished_at => 8.day.ago, :resulting_bankroll => 115)
Bet.create(:event_id => 4, :user_id => 1, :sport => 1, :public_price => -1, :amount => 5, :bet_type => "home", :parlay => false, :pending => false, :winning => false, :finished_at => 7.day.ago, :resulting_bankroll => 110)
Bet.create(:event_id => 5, :user_id => 1, :sport => 1, :public_price => -1, :amount => 5, :bet_type => "home", :parlay => false, :pending => false, :winning => true, :finished_at => 6.day.ago, :resulting_bankroll => 115)
Bet.create(:event_id => 6, :user_id => 1, :sport => 1, :public_price => -1, :amount => 5, :bet_type => "home", :parlay => false, :pending => false, :winning => true, :finished_at => 5.day.ago, :resulting_bankroll => 120)
Bet.create(:event_id => 7, :user_id => 1, :sport => 2, :public_price => -1, :amount => 5, :bet_type => "home", :parlay => false, :pending => false, :winning => true, :finished_at => 4.day.ago, :resulting_bankroll => 125)
Bet.create(:event_id => 8, :user_id => 1, :sport => 2, :public_price => -1, :amount => 10, :bet_type => "home", :parlay => false, :pending => false, :winning => true, :finished_at => 3.day.ago, :resulting_bankroll => 135)
Bet.create(:event_id => 9, :user_id => 1, :sport => 2, :public_price => -1, :amount => 5, :bet_type => "home", :parlay => false, :pending => false, :winning => false, :finished_at => 2.day.ago, :resulting_bankroll => 130)
Bet.create(:event_id => 10, :user_id => 1, :sport => 2, :public_price => -1, :amount => 5, :bet_type => "home", :parlay => false, :pending => false, :winning => true, :finished_at => 1.day.ago, :resulting_bankroll => 135)

Bet.create(:event_id => 1, :user_id => 1, :sport => 1, :public_price => -1, :amount => 5, :bet_type => "home", :parlay => false, :pending => true)
Bet.create(:event_id => 2, :user_id => 1, :sport => 1, :public_price => -1, :amount => 5, :bet_type => "home", :parlay => false, :pending => true)
Bet.create(:event_id => 3, :user_id => 1, :sport => 1, :public_price => -1, :amount => 5, :bet_type => "home", :parlay => false, :pending => true)
Bet.create(:event_id => 4, :user_id => 1, :sport => 1, :public_price => -1, :amount => 5, :bet_type => "home", :parlay => false, :pending => true)
Bet.create(:event_id => 5, :user_id => 1, :sport => 1, :public_price => -1, :amount => 5, :bet_type => "home", :parlay => false, :pending => true)
Bet.create(:event_id => 6, :user_id => 1, :sport => 1, :public_price => -1, :amount => 5, :bet_type => "home", :parlay => false, :pending => true)
Bet.create(:event_id => 7, :user_id => 1, :sport => 1, :public_price => -1, :amount => 5, :bet_type => "home", :parlay => false, :pending => true)
Bet.create(:event_id => 8, :user_id => 1, :sport => 1, :public_price => 5, :amount => 10, :bet_type => "home", :parlay => false, :pending => true)
Bet.create(:event_id => 9, :user_id => 1, :sport => 1, :public_price => 100, :amount => 5, :bet_type => "home", :parlay => false, :pending => true)
Bet.create(:event_id => 10, :user_id => 1, :sport => 1, :public_price => 15, :amount => 5, :bet_type => "home", :parlay => false, :pending => true)

Bet.create(:event_id => 1, :user_id => 2, :sport => 1, :public_price => -1, :amount => 5, :bet_type => "home", :parlay => false, :pending => true)
Bet.create(:event_id => 2, :user_id => 2, :sport => 1, :public_price => -1, :amount => 5, :bet_type => "home", :parlay => false, :pending => true)
Bet.create(:event_id => 3, :user_id => 2, :sport => 1, :public_price => 5, :amount => 5, :bet_type => "home", :parlay => false, :pending => true)
Bet.create(:event_id => 4, :user_id => 2, :sport => 1, :public_price => -1, :amount => 5, :bet_type => "home", :parlay => false, :pending => true)
Bet.create(:event_id => 5, :user_id => 2, :sport => 1, :public_price => -1, :amount => 5, :bet_type => "home", :parlay => false, :pending => true)
Bet.create(:event_id => 6, :user_id => 2, :sport => 1, :public_price => 25, :amount => 5, :bet_type => "home", :parlay => false, :pending => true)
Bet.create(:event_id => 7, :user_id => 2, :sport => 1, :public_price => -1, :amount => 5, :bet_type => "home", :parlay => false, :pending => true)
Bet.create(:event_id => 8, :user_id => 2, :sport => 1, :public_price => -1, :amount => 10, :bet_type => "home", :parlay => false, :pending => true)
Bet.create(:event_id => 9, :user_id => 2, :sport => 1, :public_price => 10, :amount => 5, :bet_type => "home", :parlay => false, :pending => true)
Bet.create(:event_id => 10, :user_id => 2, :sport => 1, :public_price => -1, :amount => 5, :bet_type => "home", :parlay => false, :pending => true)


Bet.create(:event_id => 1, :user_id => 1, :sport => 3, :public_price => -1, :amount => 5, :bet_type => "home", :parlay => false, :pending => false, :winning => true, :finished_at => 10.day.ago, :resulting_bankroll => 140)
Bet.create(:event_id => 2, :user_id => 1, :sport => 3, :public_price => -1,  :amount => 5, :bet_type => "home", :parlay => false, :pending => false, :winning => true, :finished_at => 9.day.ago, :resulting_bankroll => 145)
Bet.create(:event_id => 3, :user_id => 1, :sport => 3, :public_price => 10, :amount => 5, :bet_type => "home", :parlay => false, :pending => false, :winning => true, :finished_at => 8.day.ago, :resulting_bankroll => 150)
Bet.create(:event_id => 4, :user_id => 1, :sport => 3, :public_price => -1, :amount => 5, :bet_type => "home", :parlay => false, :pending => false, :winning => false, :finished_at => 7.day.ago, :resulting_bankroll => 145)
Bet.create(:event_id => 5, :user_id => 1, :sport => 4, :public_price => -1, :amount => 5, :bet_type => "home", :parlay => false, :pending => false, :winning => true, :finished_at => 6.day.ago, :resulting_bankroll => 150)
Bet.create(:event_id => 6, :user_id => 1, :sport => 4, :public_price => -1, :amount => 5, :bet_type => "home", :parlay => false, :pending => false, :winning => true, :finished_at => 5.day.ago, :resulting_bankroll => 155)
Bet.create(:event_id => 7, :user_id => 1, :sport => 4, :public_price => -1, :amount => 5, :bet_type => "home", :parlay => false, :pending => false, :winning => true, :finished_at => 4.day.ago, :resulting_bankroll => 160)
Bet.create(:event_id => 8, :user_id => 1, :sport => 4, :public_price => -1, :amount => 10, :bet_type => "home", :parlay => false, :pending => false, :winning => true, :finished_at => 3.day.ago, :resulting_bankroll => 170)
Bet.create(:event_id => 9, :user_id => 1, :sport => 4, :public_price => -1, :amount => 5, :bet_type => "home", :parlay => false, :pending => false, :winning => false, :finished_at => 2.day.ago, :resulting_bankroll => 165)
Bet.create(:event_id => 10, :user_id => 1, :sport => 4, :public_price => -1, :amount => 5, :bet_type => "home", :parlay => false, :pending => false, :winning => true, :finished_at => 1.day.ago, :resulting_bankroll => 170)

Parlay.create(:amount => 5, :user_id => 1, :winning => true, :resulting_bankroll => 500, :finished_at => 2.days.ago, :pending => false)
Bet.create(:event_id => 1, :user_id => 1, :sport => 1, :public_price => -1, :amount => 5, :bet_type => "home", :parlay => true, :parlay_id => 1, :pending => false)
Bet.create(:event_id => 2, :user_id => 1, :sport => 1, :public_price => -1, :amount => 5, :bet_type => "away", :parlay => true, :parlay_id => 1, :pending => false)
Bet.create(:event_id => 3, :user_id => 1, :sport => 1, :public_price => -1, :amount => 5, :bet_type => "over", :parlay => true, :parlay_id => 1, :pending => false)
Bet.create(:event_id => 4, :user_id => 1, :sport => 1, :public_price => -1, :amount => 5, :bet_type => "under", :parlay => true, :parlay_id => 1, :pending => false)

Parlay.create(:amount => 25, :user_id => 1, :winning => false, :resulting_bankroll => 475, :finished_at => 1.days.ago, :pending => false)
Bet.create(:event_id => 7, :user_id => 1, :sport => 2, :public_price => -1, :amount => 5, :bet_type => "home", :parlay => true, :parlay_id => 2, :pending => false)
Bet.create(:event_id => 8, :user_id => 1, :sport => 2, :public_price => -1, :amount => 5, :bet_type => "away", :parlay => true, :parlay_id => 2, :pending => false)
Bet.create(:event_id => 9, :user_id => 1, :sport => 2, :public_price => -1, :amount => 5, :bet_type => "over", :parlay => true, :parlay_id => 2, :pending => false)
Bet.create(:event_id => 10, :user_id => 1, :sport => 2, :public_price => -1, :amount => 5, :bet_type => "under", :parlay => true, :parlay_id => 2, :pending => false)




User.create(:username => "cdub", :password => "dinner", :email => "cwood32k@gmail.com", :first_name => "Chris", :last_name => "Wood", :wins => 10, :losses => 10, :ties => 1, :accept_terms => true, :bankroll => 200)
User.create(:username => "sports_fan1", :password => "dinner", :email => "fan1@mail.com", :first_name => "Ron", :last_name => "Artest", :wins => 100, :losses => 35, :ties => 1, :accept_terms => true, :bankroll => 2500)
User.create(:username => "sports_fan2", :password => "dinner", :email => "fan2@mail.com", :first_name => "Kobe", :last_name => "Bryant", :wins => 7, :losses => 21, :ties => 1, :accept_terms => true, :bankroll => 20)
User.create(:username => "sports_fan3", :password => "dinner", :email => "fan3@mail.com", :first_name => "test", :last_name => "user", :wins => 2, :losses => 12, :ties => 1, :accept_terms => true, :bankroll => 5)
User.create(:username => "sports_fan4", :password => "dinner", :email => "fan4@mail.com", :first_name => "test", :last_name => "user", :wins => 18, :losses => 12, :ties => 1, :accept_terms => true, :bankroll => 565)
User.create(:username => "sports_fan5", :password => "dinner", :email => "fan5@mail.com", :first_name => "test", :last_name => "user", :wins => 56, :losses => 100, :ties => 1, :accept_terms => true, :bankroll => 1800)
User.create(:username => "sports_fan6", :password => "dinner", :email => "fan6@mail.com", :first_name => "test", :last_name => "user", :wins => 75, :losses => 75, :ties => 1, :accept_terms => true, :bankroll => 1000)
User.create(:username => "sports_fan7", :password => "dinner", :email => "fan7@mail.com", :first_name => "test", :last_name => "user", :wins => 88, :losses => 25, :ties => 1, :accept_terms => true, :bankroll => 1500)
User.create(:username => "sports_fan8", :password => "dinner", :email => "fan8@mail.com", :first_name => "test", :last_name => "user", :wins => 22, :losses => 10, :ties => 1, :accept_terms => true, :bankroll => 1500)
User.create(:username => "sports_fan9", :password => "dinner", :email => "fan9@mail.com", :first_name => "test", :last_name => "user", :wins => 22, :losses => 22, :ties => 1, :accept_terms => true, :bankroll => 200)
User.create(:username => "sports_fan10", :password => "dinner", :email => "fan10@mail.com", :first_name => "test", :last_name => "user", :wins => 65, :losses => 150, :ties => 1, :accept_terms => true, :bankroll => 300)
User.create(:username => "sports_fan11", :password => "dinner", :email => "fan11@mail.com", :first_name => "test", :last_name => "user", :wins => 4, :losses => 1, :ties => 1, :accept_terms => true, :bankroll => 400)

User.create(:username => "basketball1", :password => "dinner", :email => "fan12@mail.com", :first_name => "Ron", :last_name => "Artest", :wins => 100, :losses => 35, :ties => 13, :accept_terms => true, :bankroll => 25300)
User.create(:username => "basketball2", :password => "dinner", :email => "fan13@mail.com", :first_name => "Kobe", :last_name => "Bryant", :wins => 22432, :losses => 321, :ties => 12, :accept_terms => true, :bankroll => 232034)
User.create(:username => "basketball3", :password => "dinner", :email => "fan14@mail.com", :first_name => "test", :last_name => "user", :wins => 3422, :losses => 1342, :ties => 13, :accept_terms => true, :bankroll => 52653)
User.create(:username => "football4", :password => "dinner", :email => "fan24@mail.com", :first_name => "test", :last_name => "user", :wins => 1238, :losses => 112, :ties => 12, :accept_terms => true, :bankroll => 562655)
User.create(:username => "football5", :password => "dinner", :email => "fan15@mail.com", :first_name => "test", :last_name => "user", :wins => 56, :losses => 100, :ties => 6, :accept_terms => true, :bankroll => 12300)
User.create(:username => "football_fan6", :password => "dinner", :email => "fan16@mail.com", :first_name => "test", :last_name => "user", :wins => 735, :losses => 745, :ties => 22, :accept_terms => true, :bankroll => 1005620)
User.create(:username => "baseball_fan", :password => "dinner", :email => "fan17@mail.com", :first_name => "test", :last_name => "user", :wins => 838, :losses => 265, :ties => 1, :accept_terms => true, :bankroll => 1500)
User.create(:username => "baseball_fan2", :password => "dinner", :email => "fan18@mail.com", :first_name => "test", :last_name => "user", :wins => 212, :losses => 110, :ties => 33, :accept_terms => true, :bankroll => 152300)
User.create(:username => "baseball_fan3", :password => "dinner", :email => "fan19@mail.com", :first_name => "test", :last_name => "user", :wins => 22, :losses => 22, :ties => 2, :accept_terms => true, :bankroll => 290)
User.create(:username => "baseball_fan4", :password => "dinner", :email => "fan20@mail.com", :first_name => "test", :last_name => "user", :wins => 6445, :losses => 1540, :ties => 5, :accept_terms => true, :bankroll => 30230)
User.create(:username => "gambler", :password => "dinner", :email => "fan21@mail.com", :first_name => "test", :last_name => "user", :wins => 4, :losses => 1, :ties => 1, :accept_terms => true, :bankroll => 400)

User.create(:username => "high_roller1", :password => "dinner", :email => "fan21@mail.com", :first_name => "Ron", :last_name => "Artest", :wins => 100, :losses => 35, :ties => 13, :accept_terms => true, :bankroll => 96300)
User.create(:username => "high_roller2", :password => "dinner", :email => "fan22@mail.com", :first_name => "Kobe", :last_name => "Bryant", :wins => 22432, :losses => 321, :ties => 12, :accept_terms => true, :bankroll => 23605)
User.create(:username => "high_roller3", :password => "dinner", :email => "fan23@mail.com", :first_name => "test", :last_name => "user", :wins => 3422, :losses => 132, :ties => 13, :accept_terms => true, :bankroll => 53)
User.create(:username => "high_roller4", :password => "dinner", :email => "fan25@mail.com", :first_name => "test", :last_name => "user", :wins => 1238, :losses => 12, :ties => 12, :accept_terms => true, :bankroll => 5626)
User.create(:username => "high_roller5", :password => "dinner", :email => "fan26@mail.com", :first_name => "test", :last_name => "user", :wins => 56, :losses => 10, :ties => 6, :accept_terms => true, :bankroll => 1230)
User.create(:username => "high_roller6", :password => "dinner", :email => "fan27@mail.com", :first_name => "test", :last_name => "user", :wins => 735, :losses => 45, :ties => 22, :accept_terms => true, :bankroll => 10620)
User.create(:username => "high_roller7", :password => "dinner", :email => "fan28@mail.com", :first_name => "test", :last_name => "user", :wins => 838, :losses => 26, :ties => 1, :accept_terms => true, :bankroll => 1501)
User.create(:username => "high_roller8", :password => "dinner", :email => "fan29@mail.com", :first_name => "test", :last_name => "user", :wins => 212, :losses => 10, :ties => 33, :accept_terms => true, :bankroll => 15200)
User.create(:username => "high_roller9", :password => "dinner", :email => "fan30@mail.com", :first_name => "test", :last_name => "user", :wins => 22, :losses => 22, :ties => 2, :accept_terms => true, :bankroll => 2940)
User.create(:username => "high_roller10", :password => "dinner", :email => "fan31@mail.com", :first_name => "test", :last_name => "user", :wins => 6445, :losses => 10, :ties => 5, :accept_terms => true, :bankroll => 300)
User.create(:username => "high_roller11", :password => "dinner", :email => "fan32@mail.com", :first_name => "test", :last_name => "user", :wins => 4, :losses => 1, :ties => 1, :accept_terms => true, :bankroll => 40)


