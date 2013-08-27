class Bet < ActiveRecord::Base
  belongs_to :user
  belongs_to :event
  has_many :purchases
  
  attr_accessible :amount, :bet_home, :over_under, :bet_type, :sport, :event_id, :user_id, :parlay, :parlay_id, :pending, :winning, :closed_at, :resulting_bankroll, :public, :duck_price, :money_price
  
  validates :amount, :numericality => {:greater_than => 0}
  validates_presence_of :bet_type
  
  scope :get_pending, where(:pending => true) 
  
  def won(event_obj, home_score, away_score)
    puts "home score #{event_obj.home_team}: " + home_score.to_s
    puts "away score #{event_obj.away_team}: " + away_score.to_s    
     
    case bet_type
      when "home"
        case event_obj.sport
          when 1
            if home_score + event_obj.spread > away_score 
              true
            end
          when 2
            if home_score + event_obj.spread > away_score 
              true
            end
          when 3
            if home_score > away_score
            true
          end
          when 4
        end        
      when "away"
        case event_obj.sport
          when 1
            if home_score + event_obj.spread < away_score 
              true
            end
          when 2
            if home_score + event_obj.spread < away_score 
              true
            end
          when 3
            if away_score > home_score
              true
            end
          when 4
       end
      when "over"
        if home_score + away_score > event_obj.total_points
          true
        end
      when "under"
        if home_score + away_score < event_obj.total_points
          true
        end
    end
    false 
  end
  
  def self.close_bets
    logger.info "Closing Bets!!!!!!!!!!!!!!!!!!!!!!!!" 
    mlb_game_url = "http://sportscaster.xmlteam.com/gateway/php_ci/searchEvents.php?league-keys=l.mlb.com&date-offset=0&date-offset-span=1&date-offset-midnight=1600&sort-order=asc&publisher-keys=sportsnetwork.com&max-result-count=200&content-returned=metadata-and-scores&content-format=sportsml&rendering-engine=mvc-view&gateway-theme=default&query-debug=false"
    
    xml_doc = Nokogiri::XML(open(mlb_game_url, :http_basic_authentication => ["prosperitech", "l1v3l0ng"]))
    xml_doc.xpath('//sports-event').each do |event_xml|
      puts "$$$$$$$$$$$$$$$$$$$$$$$$$start item$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$"
      event_obj = Event.find_by_extern_id(event_xml.xpath('./event-metadata/@event-key').to_s)
      if event_xml.xpath("./team/team-metadata[@alignment='home']/../team-stats/@event-outcome").to_s != "undecided" 
         event_obj.finished = true
         event_obj.save
      end      
      bets_for_event = Bet.where(:event_id => event_obj.id, :pending => true)
      puts bets_for_event.length
      if bets_for_event.length > 0
        bets_for_event.each do |bet|
          if event_obj.finished?           
            user = bet.user            
            if bet.won(event_obj, event_xml.xpath("./team/team-metadata[@alignment='home']/../team-stats/@score").to_s.to_i, event_xml.xpath("./team/team-metadata[@alignment='away']/../team-stats/@score").to_s.to_i)
              
              user.wins += 1
              user.win_percentage = user.wins / (user.wins + user.losses + user.ties)
              case bet.sport
              when 1
                user.nfl_wins += 1
                user.bankroll += bet.amount
                user.nfl_win_percentage = user.nfl_wins / (user.nfl_wins + user.nfl_losses + user.nfl_ties)
              when 2
                user.nba_wins += 1
                user.bankroll += bet.amount
                user.nba_win_percentage = user.nba_wins / (user.nba_wins + user.nba_losses + user.nba_ties)
              when 3
                user.mlb_wins += 1
                if bet.bet_type == "home"
                  if event_obj.moneyline_home > 0
                    user.bankroll += bet.amount * event_obj.moneyline_home / 100
                  else 
                    user.bankroll += bet.amount * 100 / event_obj.moneyline_home.abs 
                  end
                elsif bet.bet_type == "away"
                  if event_obj.moneyline_away > 0
                    user.bankroll += bet.amount * event_obj.moneyline_away / 100
                  else 
                    user.bankroll += bet.amount * 100 / event_obj.moneyline_away.abs 
                  end
                else
                  user.bankroll += bet.amount
                end
                user.mlb_win_percentage = user.mlb_wins / (user.mlb_wins + user.mlb_losses + user.mlb_ties)
              when 4
                user.nhl_wins += 1
                user.bankroll += bet.amount
                user.nhl_win_percentage = user.nhl_wins / (user.nhl_wins + user.nhl_losses + user.nhl_ties)
              end
              user.save
              bet.resulting_bankroll = user.bankroll
              bet.winning = true
            else              
              user.losses += 1
              user.win_percentage = user.wins / (user.wins + user.losses + user.ties)
              case bet.sport
              when 1
                user.nfl_losses += 1
                user.bankroll -= bet.amount
                user.nfl_win_percentage = user.nfl_wins / (user.nfl_wins + user.nfl_losses + user.nfl_ties)
              when 2
                user.nba_losses += 1
                user.bankroll -= bet.amount
                user.nba_win_percentage = user.nba_wins / (user.nba_wins + user.nba_losses + user.nba_ties)
              when 3
                user.mlb_losses += 1
                user.mlb_wins += 1
                if bet.bet_type == "home"
                  if event_obj.moneyline_home > 0
                    user.bankroll -= bet.amount * event_obj.moneyline_home / 100
                  else 
                    user.bankroll -= bet.amount * 100 / event_obj.moneyline_home.abs 
                  end
                elsif bet.bet_type == "away"
                  if event_obj.moneyline_away > 0
                    user.bankroll -= bet.amount * event_obj.moneyline_away / 100
                  else 
                    user.bankroll -= bet.amount * 100 / event_obj.moneyline_away.abs 
                  end
                else
                  user.bankroll -= bet.amount
                end
                user.mlb_win_percentage = user.mlb_wins / (user.mlb_wins + user.mlb_losses + user.mlb_ties)
              when 4
                user.nhl_losses += 1
                user.bankroll -= bet.amount
                user.nhl_win_percentage = user.nhl_wins / (user.nhl_wins + user.nhl_losses + user.nhl_ties)
              end
              user.save
              bet.resulting_bankroll = user.bankroll
              bet.winning = false
            end
            
            bet.pending = false
            bet.closed_at = Time.now.to_date
            
            bet.save
            puts "$$$$$$$$$$$$$$$$$$$$$$$$$end item$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$"
           end
         end
      end
    end
  end
  
end
