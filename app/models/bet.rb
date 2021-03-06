class Bet < ActiveRecord::Base
  belongs_to :user
  belongs_to :event
  has_many :purchases
  
  attr_accessible :amount, :bet_home, :over_under, :bet_type, :sport, :event_id, :user_id, :parlay, :parlay_id, :pending, :winning, :closed_at, :resulting_bankroll, :public, :money_price
  
  validates :amount, :numericality => {:greater_than => 0}
  validates_presence_of :bet_type
  
  scope :get_pending, where(:pending => true) 

  def payout

  end 
  
  def won(event_obj, home_score, away_score)
    puts "home score #{event_obj.home_team}: " + home_score.to_s
    puts "away score #{event_obj.away_team}: " + away_score.to_s    
     
    case bet_type
      when "home"
        case event_obj.sport
          when 1
            if home_score + event_obj.spread > away_score 
              return true
            end
          when 2
            if home_score + event_obj.spread > away_score 
              return true
            end
          when 3
            if home_score > away_score
            return true
          end
          when 4
        end        
      when "away"
        case event_obj.sport
          when 1
            if home_score + event_obj.spread < away_score 
              return true
            end
          when 2
            if home_score + event_obj.spread < away_score 
              return true
            end
          when 3
            if away_score > home_score
              return true
            end
          when 4
        end
      when "over"
        if home_score + away_score > event_obj.total_points
          return true
        end
      when "under"
        if home_score + away_score < event_obj.total_points
          return true
        end
    end
    false 
  end
  
  def self.close_bets
    nfl_game_url = "http://sportscaster.xmlteam.com/gateway/php_ci/searchEvents.php?league-keys=l.nfl.com&date-offset=-1&date-offset-span=2&date-offset-midnight=1600&sort-order=asc&publisher-keys=sportsnetwork.com&max-result-count=200&content-returned=metadata-and-scores&content-format=sportsml&rendering-engine=mvc-view&gateway-theme=default&query-debug=false"
    nba_game_url = "http://sportscaster.xmlteam.com/gateway/php_ci/searchEvents.php?league-keys=l.nba.com&date-offset=-1&date-offset-span=2&date-offset-midnight=1600&sort-order=asc&publisher-keys=sportsnetwork.com&max-result-count=200&content-returned=metadata-and-scores&content-format=sportsml&rendering-engine=mvc-view&gateway-theme=default&query-debug=false"
    mlb_game_url = "http://sportscaster.xmlteam.com/gateway/php_ci/searchEvents.php?league-keys=l.mlb.com&date-offset=-1&date-offset-span=2&date-offset-midnight=1600&sort-order=asc&publisher-keys=sportsnetwork.com&max-result-count=200&content-returned=metadata-and-scores&content-format=sportsml&rendering-engine=mvc-view&gateway-theme=default&query-debug=false"
    nhl_game_url = ""

    xml_doc = Nokogiri::XML(open(nfl_game_url, :http_basic_authentication => ["prosperitech", "l1v3l0ng"]))
    xml_doc.xpath('//sports-event').each do |event_xml|      
      event_obj = Event.find_by_extern_id(event_xml.xpath('./event-metadata/@event-key').to_s)
      if !event_obj.nil? && event_xml.xpath("./team/team-metadata[@alignment='home']/../team-stats/@event-outcome").to_s != "undecided" 
         event_obj.finished = true
         event_obj.save
        bets_for_event = Bet.where(:event_id => event_obj.id, :pending => true)
        if bets_for_event.length > 0
          bets_for_event.each do |bet|       
              user = bet.user  
              event_obj.home_total = event_xml.xpath("./team/team-metadata[@alignment='home']/../team-stats/@score").to_s.to_i
              event_obj.away_total = event_xml.xpath("./team/team-metadata[@alignment='away']/../team-stats/@score").to_s.to_i
              event_obj.save          
              if bet.won(event_obj, event_obj.home_total, event_obj.away_total)
                
                user.wins += 1
                user.assign_win_percentage
                case bet.sport
                when 1
                  user.nfl_wins += 1
                  user.bankroll += bet.amount 
                  user.available_bankroll += bet.amount + bet.amount
                  user.assign_nfl_win_percentage              
                end
                user.save
                bet.resulting_bankroll = user.bankroll
                bet.winning = true
              else              
                user.losses += 1
                user.assign_win_percentage
                case bet.sport
                when 1
                  user.nfl_losses += 1
                  user.bankroll -= bet.amount
                  user.assign_nfl_win_percentage              
                end
                user.save
                bet.resulting_bankroll = user.bankroll
                bet.winning = false
              end
              
              bet.pending = false
              bet.closed_at = Time.zone.now.to_date
              
              bet.save
             end
           end
        end
    end

    xml_doc = Nokogiri::XML(open(nba_game_url, :http_basic_authentication => ["prosperitech", "l1v3l0ng"]))
    xml_doc.xpath('//sports-event').each do |event_xml|
      event_obj = Event.find_by_extern_id(event_xml.xpath('./event-metadata/@event-key').to_s)
      if !event_obj.nil? && event_xml.xpath("./team/team-metadata[@alignment='home']/../team-stats/@event-outcome").to_s != "undecided" 
         event_obj.finished = true
         event_obj.save 
        bets_for_event = Bet.where(:event_id => event_obj.id, :pending => true)
        if bets_for_event.length > 0
          bets_for_event.each do |bet|          
              user = bet.user       
              event_obj.home_total = event_xml.xpath("./team/team-metadata[@alignment='home']/../team-stats/@score").to_s.to_i
              event_obj.away_total = event_xml.xpath("./team/team-metadata[@alignment='away']/../team-stats/@score").to_s.to_i
              event_obj.save      
              if bet.won(event_obj, event_obj.home_total, event_obj.away_total)
                
                user.wins += 1
                user.assign_win_percentage
                case bet.sport
                when 2
                  user.nba_wins += 1
                  user.bankroll += bet.amount 
                  user.available_bankroll += bet.amount + bet.amount
                  user.assign_nba_win_percentage              
                end
                user.save
                bet.resulting_bankroll = user.bankroll
                bet.winning = true
              else              
                user.losses += 1
                user.assign_win_percentage
                case bet.sport
                when 2
                  user.nba_losses += 1
                  user.bankroll -= bet.amount
                  user.assign_nba_win_percentage              
                end
                user.save
                bet.resulting_bankroll = user.bankroll
                bet.winning = false
              end
              
              bet.pending = false
              bet.closed_at = Time.zone.now.to_date
              
              bet.save
             end
           end
        end
    end
    

    xml_doc = Nokogiri::XML(open(mlb_game_url, :http_basic_authentication => ["prosperitech", "l1v3l0ng"]))
    xml_doc.xpath('//sports-event').each do |event_xml|
      event_obj = Event.find_by_extern_id(event_xml.xpath('./event-metadata/@event-key').to_s)
      if !event_obj.nil? && event_xml.xpath("./team/team-metadata[@alignment='home']/../team-stats/@event-outcome").to_s != "undecided" 
        event_obj.finished = true
        event_obj.save
     
        bets_for_event = Bet.where(:event_id => event_obj.id, :pending => true)
        if bets_for_event.length > 0
          bets_for_event.each do |bet|        
              user = bet.user     
              event_obj.home_total = event_xml.xpath("./team/team-metadata[@alignment='home']/../team-stats/@score").to_s.to_i
              event_obj.away_total = event_xml.xpath("./team/team-metadata[@alignment='away']/../team-stats/@score").to_s.to_i
              event_obj.save        
              if bet.won(event_obj, event_obj.home_total, event_obj.away_total)
                
                user.wins += 1
                user.assign_win_percentage
                case bet.sport              
                when 3
                  user.mlb_wins += 1
                  if bet.bet_type == "home"
                    if event_obj.moneyline_home > 0
                      user.available_bankroll += bet.amount + bet.amount * event_obj.moneyline_home / 100
                      user.bankroll += bet.amount * event_obj.moneyline_home / 100
                    else 
                      user.available_bankroll += bet.amount + bet.amount * 100 / event_obj.moneyline_home.abs 
                      user.bankroll += bet.amount * 100 / event_obj.moneyline_home.abs 
                    end
                  elsif bet.bet_type == "away"
                    if event_obj.moneyline_away > 0
                      user.available_bankroll += bet.amount + bet.amount * event_obj.moneyline_away / 100
                      user.bankroll += bet.amount * event_obj.moneyline_away / 100
                    else 
                      user.available_bankroll += bet.amount + bet.amount * 100 / event_obj.moneyline_away.abs
                      user.bankroll += bet.amount * 100 / event_obj.moneyline_away.abs 
                    end
                  else
                    user.available_bankroll += bet.amount + bet.amount
                    user.bankroll += bet.amount
                  end
                  user.assign_mlb_win_percentage              
                end
                user.save!
                bet.resulting_bankroll = user.bankroll
                bet.winning = true
              else              
                user.losses += 1
                user.assign_win_percentage
                case bet.sport              
                when 3
                  user.mlb_losses += 1
                  if bet.bet_type == "home"
                    if event_obj.moneyline_home > 0
                      user.bankroll -= bet.amount
                    else 
                      user.bankroll -= bet.amount
                    end
                  elsif bet.bet_type == "away"
                    if event_obj.moneyline_away > 0
                      user.bankroll -= bet.amount
                    else 
                      user.bankroll -= bet.amount
                    end
                  else
                    user.bankroll -= bet.amount
                  end
                  user.assign_mlb_win_percentage              
                end
                user.save!
                bet.resulting_bankroll = user.bankroll
                bet.winning = false
              end
              
              bet.pending = false
              bet.closed_at = Time.zone.now
              
              bet.save!
             end
           end
        end
    end
    
=begin
  xml_doc = Nokogiri::XML(open(nhl_game_url, :http_basic_authentication => ["prosperitech", "l1v3l0ng"]))
    xml_doc.xpath('//sports-event').each do |event_xml|
      event_obj = Event.find_by_extern_id(event_xml.xpath('./event-metadata/@event-key').to_s)
      if !event_obj.nil? && event_xml.xpath("./team/team-metadata[@alignment='home']/../team-stats/@event-outcome").to_s != "undecided" 
         event_obj.finished = true
         event_obj.save
        bets_for_event = Bet.where(:event_id => event_obj.id, :pending => true)
        if bets_for_event.length > 0
          bets_for_event.each do |bet|           
              user = bet.user            
              if bet.won(event_obj, event_xml.xpath("./team/team-metadata[@alignment='home']/../team-stats/@score").to_s.to_i, event_xml.xpath("./team/team-metadata[@alignment='away']/../team-stats/@score").to_s.to_i)
                
                user.wins += 1
                user.assign_win_percentage
                case bet.sport              
                when 4
                  user.nhl_wins += 1
                  user.bankroll += bet.amount + bet.amount
                  user.assign_nhl_win_percentage
                end
                user.save
                bet.resulting_bankroll = user.bankroll
                bet.winning = true
              else              
                user.losses += 1
                user.assign_win_percentage
                case bet.sport              
                when 4
                  user.nhl_losses += 1
                  user.bankroll -= bet.amount
                  user.assign_nhl_win_percentage
                end
                user.save
                bet.resulting_bankroll = user.bankroll
                bet.winning = false
              end
              
              bet.pending = false
              bet.closed_at = Time.zone.now.to_date
              
              bet.save
             end
           end
        end
    end  
=end
  end
end

