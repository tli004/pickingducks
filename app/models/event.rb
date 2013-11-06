require 'nokogiri'
require 'open-uri'
require 'date'

class Event < ActiveRecord::Base
  has_many :bets
  
  attr_accessible :sport, :spread, :moneyline_home, :moneyline_away, :total_points, :start_time, :live, :finished, :home_team, :home_location, :away_team, :away_location, :extern_id
  
  scope :popular_events_nfl, joins(:bets).where(:sport => 1).group('events.id').having('count(bets.id) >= 10')
  scope :popular_events_nba, joins(:bets).where(:sport => 2).group('events.id').having('count(bets.id) >= 10')
  scope :popular_events_mlb, joins(:bets).where(:sport => 3).group('events.id').having('count(bets.id) >= 10')
  scope :popular_events_nhl, joins(:bets).where(:sport => 4).group('events.id').having('count(bets.id) >= 10')
  
  def self.find_consensus_picks
    consensus_picks = []
    nfl_consensus = nil
    popular_events_nfl.each do |event|
      if nfl_consensus == nil
        nfl_consensus = event
      else
        if event.consensus[1] > nfl_consensus.consensus[1]
          nfl_consensus = event
        end
      end
    end 
    nba_consensus = nil
    popular_events_nba.each do |event|
      if nba_consensus == nil
        nba_consensus = event
      else
        if event.consensus[1] > nba_consensus.consensus[1]
          nba_consensus = event
        end
      end
    end
    mlb_consensus = nil
    popular_events_mlb.each do |event|
      if mlb_consensus == nil
        mlb_consensus = event
      else
        if event.consensus[1] > mlb_consensus.consensus[1]
          mlb_consensus = event
        end
      end
    end
    nhl_consensus = nil
    popular_events_nhl.each do |event|
      if nhl_consensus == nil
        nhl_consensus = event
      else
        if event.consensus[1] > nhl_consensus.consensus[1]
          nhl_consensus = event
        end
      end
    end
    [nfl_consensus, nba_consensus, mlb_consensus, nhl_consensus].compact
  end
  
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
    return [[home_team, home_count], [away_team, away_count], ['Over', over_count], ['Under', under_count]].at([home_count, away_count, over_count, under_count].index([home_count, away_count, over_count, under_count].max))
  end
  
  def self.parse_events
    #
    # U: prosperitech
    # P: l1v3l0ng
    #
    
    
    nfl_odds_url = "http://sportscaster.xmlteam.com/gateway/php_ci/searchDocuments.php?sport-keys=l.nfl.com&league-keys=l.nfl.com&fixture-keys=odds&date-window=16800revision-control=all&publisher-keys=sportsnetwork.com&max-result-count=5&content-returned=all-content&content-format=sportsml&rendering-engine=xslt&gateway-theme=default&query-debug=false"
    
    nba_odds_url = "http://sportscaster.xmlteam.com/gateway/php_ci/searchDocuments.php?sport-keys=l.nba.com&league-keys=l.nba.com&fixture-keys=odds&date-window=16800revision-control=all&publisher-keys=sportsnetwork.com&max-result-count=5&content-returned=all-content&content-format=sportsml&rendering-engine=xslt&gateway-theme=default&query-debug=false"
    
    mlb_odds_url = "http://sportscaster.xmlteam.com/gateway/php_ci/searchDocuments.php?sport-keys=l.mlb.com&league-keys=l.mlb.com&fixture-keys=odds&date-window=16800&revision-control=all&publisher-keys=sportsnetwork.com&max-result-count=5&content-returned=all-content&content-format=sportsml&rendering-engine=xslt&gateway-theme=default&query-debug=false"
    
    nhl_odds_url = "http://sportscaster.xmlteam.com/gateway/php_ci/searchDocuments.php?sport-keys=l.nhl.com&league-keys=l.nhl.com&fixture-keys=odds&date-window=16800revision-control=all&publisher-keys=sportsnetwork.com&max-result-count=5&content-returned=all-content&content-format=sportsml&rendering-engine=xslt&gateway-theme=default&query-debug=false"
    
    xml_doc = Nokogiri::XML(open(nfl_odds_url, :http_basic_authentication => ["prosperitech", "l1v3l0ng"]))
    xml_doc.xpath('//sports-event').each do |event|      
      event_key = event.xpath('./event-metadata/@event-key').to_s
      one_event = Event.find_by_extern_id(event_key)
      if one_event.nil? || (one_event.spread.nil? && one_event.moneyline_home.nil?)
        one_event.destroy if !one_event.nil?
        new_event = Event.new
        new_event.extern_id = event_key
        new_event.start_time = DateTime.parse(event.xpath('./event-metadata/@start-date-time').to_s)
        new_event.sport = 1
        event.xpath('./team').each do |team|
          if team.xpath('./team-metadata/@alignment').to_s == 'home'
            new_event.home_location = team.xpath('./team-metadata/name/@first').to_s
            new_event.home_team = team.xpath('./team-metadata/name/@last').to_s
          else
            new_event.away_location = team.xpath('./team-metadata/name/@first').to_s
            new_event.away_team = team.xpath('./team-metadata/name/@last').to_s
          end
        end        
        new_event.spread = event.xpath('./team/team-metadata[@alignment="home"]/../wagering-stats/wagering-straight-spread[1]/@value').to_s     
        new_event.total_points = event.xpath('./team/team-metadata[@alignment="home"]/../wagering-stats/wagering-total-score[1]/@total').to_s       
        
        new_event.save!
     end     
    end  
    
    xml_doc = Nokogiri::XML(open(nba_odds_url, :http_basic_authentication => ["prosperitech", "l1v3l0ng"]))
    xml_doc.xpath('//sports-event').each do |event|      
      event_key = event.xpath('./event-metadata/@event-key').to_s
      one_event = Event.find_by_extern_id(event_key)
      if one_event.nil? || (one_event.spread.nil? && one_event.moneyline_home.nil?)
        one_event.destroy if !one_event.nil?
        new_event = Event.new
        new_event.extern_id = event_key
        new_event.start_time = DateTime.parse(event.xpath('./event-metadata/@start-date-time').to_s)
        new_event.sport = 2
        event.xpath('./team').each do |team|
          if team.xpath('./team-metadata/@alignment').to_s == 'home'
            new_event.home_location = team.xpath('./team-metadata/name/@first').to_s
            new_event.home_team = team.xpath('./team-metadata/name/@last').to_s
          else
            new_event.away_location = team.xpath('./team-metadata/name/@first').to_s
            new_event.away_team = team.xpath('./team-metadata/name/@last').to_s
          end
        end        
        new_event.spread = event.xpath('./team/team-metadata[@alignment="home"]/../wagering-stats/wagering-straight-spread[1]/@value').to_s 
        new_event.total_points = event.xpath('./team/team-metadata[@alignment="home"]/../wagering-stats/wagering-total-score[1]/@total').to_s       
        
        new_event.save!
      end     
    end      
        
    xml_doc = Nokogiri::XML(open(mlb_odds_url, :http_basic_authentication => ["prosperitech", "l1v3l0ng"]))
    xml_doc.xpath('//sports-event').each do |event|      
      event_key = event.xpath('./event-metadata/@event-key').to_s
      one_event = Event.find_by_extern_id(event_key)
      if one_event.nil? || (one_event.spread.nil? && one_event.moneyline_home.nil?)
        one_event.destroy if !one_event.nil?
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
    
    xml_doc = Nokogiri::XML(open(nhl_odds_url, :http_basic_authentication => ["prosperitech", "l1v3l0ng"]))
    xml_doc.xpath('//sports-event').each do |event|      
      event_key = event.xpath('./event-metadata/@event-key').to_s
      one_event = Event.find_by_extern_id(event_key)
      if one_event.nil? || (one_event.spread.nil? && one_event.moneyline_home.nil?)
        one_event.destroy if !one_event.nil?
        new_event = Event.new
        new_event.extern_id = event_key
        new_event.start_time = DateTime.parse(event.xpath('./event-metadata/@start-date-time').to_s)
        new_event.sport = 4
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
    
      
    
  end

  def self.calc_payout(id, amount, pick)
    event = find_by_id(id)
    if event.sport != 3
      return amount
    else
      if !event.moneyline_home.nil? && event.moneyline_home > 0
        if pick == event.home_team
          return bet.amount * event_obj.moneyline_home / 100
        else
          return bet.amount * event_obj.moneyline_away / 100
        end
      else
        return amount
      end
    end
  end
  
  
end
