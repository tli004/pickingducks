require 'nokogiri'
require 'open-uri'
require 'date'

class Event < ActiveRecord::Base
  has_many :bets
  
  attr_accessible :sport, :spread, :moneyline_home, :moneyline_away, :total_points, :start_time, :live, :finished, :home_team, :home_location, :away_team, :away_location, :extern_id
  
  def bet_type(bet_type)
    case bet_type
    when 'home'
      home_team
    when 'away'
      away_team
    when 'over'
      'Over'
    when 'under'
      'Under'
    end
  end
  
  def consensus
    home_count = bets.where(:bet_type => 'home').count
    away_count = bets.where(:bet_type => 'away').count
    over_count = bets.where(:bet_type => 'over').count
    under_count = bets.where(:bet_type => 'under').count
    return [home_team, away_team, 'Over', 'Under'].at([home_count, away_count, over_count, under_count].index([home_count, away_count, over_count, under_count].max))
  end
  
  def self.parse_events
    #
    # U: prosperitech
    # P: l1v3l0ng
    #
    
    
    #nfl_odds_url = ""
    
    #nba_odds_url = ""
    
    mlb_odds_url = "http://sportscaster.xmlteam.com/gateway/php_ci/searchDocuments.php?sport-keys=l.mlb.com&league-keys=l.mlb.com&fixture-keys=odds&date-window=2400&revision-control=all&publisher-keys=sportsnetwork.com&max-result-count=5&content-returned=all-content&content-format=sportsml&rendering-engine=xslt&gateway-theme=default&query-debug=false"
    
    #nhl_odds_url = ""
    
    #xml_doc = Nokogiri::XML(open(nfl_odds_url, :http_basic_authentication => ["prosperitech", "l1v3l0ng"]))
    #xml_doc.xpath('//sports-event').each do |event|      
    #  event_key = event.xpath('./event-metadata/@event-key').to_s
    #  if Event.find_by_extern_id(event_key).nil?
    #    new_event = Event.new
    #    new_event.extern_id = event_key
    #    new_event.start_time = DateTime.parse(event.xpath('./event-metadata/@start-date-time').to_s)
    #    new_event.sport = 1
    #    event.xpath('./team').each do |team|
    #      if team.xpath('./team-metadata/@alignment').to_s == 'home'
    #        new_event.home_location = team.xpath('./team-metadata/name/@first').to_s
    #        new_event.home_team = team.xpath('./team-metadata/name/@last').to_s
    #      else
    #        new_event.away_location = team.xpath('./team-metadata/name/@first').to_s
    #        new_event.away_team = team.xpath('./team-metadata/name/@last').to_s
    #      end
    #    end        
    #    new_event.spread = event.xpath('./team/team-metadata[@alignment="home"]/../wagering-stats/').to_s     
    #    new_event.total_points = event.xpath('./team/team-metadata[@alignment="home"]/../wagering-stats/wagering-total-score[1]/@total').to_s       
        
    #   new_event.save!
    # end     
    #end  
    
    #xml_doc = Nokogiri::XML(open(nba_odds_url, :http_basic_authentication => ["prosperitech", "l1v3l0ng"]))
    #xml_doc.xpath('//sports-event').each do |event|      
    #  event_key = event.xpath('./event-metadata/@event-key').to_s
    #  if Event.find_by_extern_id(event_key).nil?
    #    new_event = Event.new
    #    new_event.extern_id = event_key
    #    new_event.start_time = DateTime.parse(event.xpath('./event-metadata/@start-date-time').to_s)
    #    new_event.sport = 2
    #    event.xpath('./team').each do |team|
    #      if team.xpath('./team-metadata/@alignment').to_s == 'home'
    #        new_event.home_location = team.xpath('./team-metadata/name/@first').to_s
    #        new_event.home_team = team.xpath('./team-metadata/name/@last').to_s
    #      else
    #        new_event.away_location = team.xpath('./team-metadata/name/@first').to_s
    #        new_event.away_team = team.xpath('./team-metadata/name/@last').to_s
    #      end
    #    end        
    #    new_event.spread = event.xpath('./team/team-metadata[@alignment="home"]/../wagering-stats/').to_s 
    #    new_event.total_points = event.xpath('./team/team-metadata[@alignment="home"]/../wagering-stats/wagering-total-score[1]/@total').to_s       
        
    #    new_event.save!
    #  end     
    #end      
        
    xml_doc = Nokogiri::XML(open(mlb_odds_url, :http_basic_authentication => ["prosperitech", "l1v3l0ng"]))
    xml_doc.xpath('//sports-event').each do |event|      
      event_key = event.xpath('./event-metadata/@event-key').to_s
      if Event.find_by_extern_id(event_key).nil?
        new_event = Event.new
        new_event.extern_id = event_key
        new_event.start_time = DateTime.parse(event.xpath('./event-metadata/@start-date-time').to_s)
        new_event.sport = 3
        event.xpath('./team').each do |team|
          if team.xpath('./team-metadata/@alignment').to_s == 'home'
            new_event.home_location = team.xpath('./team-metadata/name/@first').to_s
            new_event.home_team = team.xpath('./team-metadata/name/@last').to_s
          else
            new_event.away_location = team.xpath('./team-metadata/name/@first').to_s
            new_event.away_team = team.xpath('./team-metadata/name/@last').to_s
          end
        end        
        new_event.moneyline_home = event.xpath('./team/team-metadata[@alignment="home"]/../wagering-stats/wagering-moneyline[1]/@line').to_s   
        new_event.moneyline_away = event.xpath('./team/team-metadata[@alignment="away"]/../wagering-stats/wagering-moneyline[1]/@line').to_s     
        new_event.total_points = event.xpath('./team/team-metadata[@alignment="home"]/../wagering-stats/wagering-total-score[1]/@total').to_s       
        
        new_event.save!
      end     
    end  
    
    #xml_doc = Nokogiri::XML(open(nhl_odds_url, :http_basic_authentication => ["prosperitech", "l1v3l0ng"]))
    #xml_doc.xpath('//sports-event').each do |event|      
    #  event_key = event.xpath('./event-metadata/@event-key').to_s
    #  if Event.find_by_extern_id(event_key).nil?
    #    new_event = Event.new
    #    new_event.extern_id = event_key
    #    new_event.start_time = DateTime.parse(event.xpath('./event-metadata/@start-date-time').to_s)
    #    new_event.sport = 4
    #    event.xpath('./team').each do |team|
    #      if team.xpath('./team-metadata/@alignment').to_s == 'home'
    #        new_event.home_location = team.xpath('./team-metadata/name/@first').to_s
    #        new_event.home_team = team.xpath('./team-metadata/name/@last').to_s
    #      else
    #        new_event.away_location = team.xpath('./team-metadata/name/@first').to_s
    #        new_event.away_team = team.xpath('./team-metadata/name/@last').to_s
    #      end
    #    end        
    #    new_event.moneyline_home = event.xpath('./team/team-metadata[@alignment="home"]/../wagering-stats/wagering-moneyline[1]/@line').to_s   
    #    new_event.moneyline_away = event.xpath('./team/team-metadata[@alignment="away"]/../wagering-stats/wagering-moneyline[1]/@line').to_s     
    #    new_event.total_points = event.xpath('./team/team-metadata[@alignment="home"]/../wagering-stats/wagering-total-score[1]/@total').to_s       
        
    #    new_event.save!
    #  end     
    #end  
    
      
    
  end
  
  
end
