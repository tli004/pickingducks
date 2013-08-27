require 'nokogiri'
require 'open-uri'
require 'date'

#
# U: prosperitech
# P: l1v3l0ng
#

odds_url = "http://sportscaster.xmlteam.com/gateway/php_ci/searchDocuments.php?sport-keys=l.mlb.com&league-keys=l.mlb.com&fixture-keys=odds&date-window=2400&revision-control=all&publisher-keys=sportsnetwork.com&max-result-count=5&content-returned=all-content&content-format=sportsml&rendering-engine=xslt&gateway-theme=default&query-debug=false"

game_url = "http://sportscaster.xmlteam.com/gateway/php_ci/searchEvents.php?league-keys=l.mlb.com&date-offset=0&date-offset-span=1&date-offset-midnight=1600&sort-order=asc&publisher-keys=sportsnetwork.com&max-result-count=200&content-returned=metadata-and-scores&content-format=sportsml&rendering-engine=mvc-view&gateway-theme=default&query-debug=false"

xml_doc = Nokogiri::XML(open(odds_url, :http_basic_authentication => ["prosperitech", "l1v3l0ng"]))
xml_doc.xpath('//sports-event').each do |event|
  puts "######################start item############################"
  new_event = Event.new
  new_event.start_time = DateTime.parse(event.xpath('./event-metadata/@start-date-time').to_s)
  
  new_event.extern_id = event.xpath('./event-metadata/@event-key')
  event.xpath('./team').each do |team|
    if team.xpath('./team-metadata/@alignment') == 'home'
      new_event.home_location = team.xpath('./team-metadata/name/@first')
      new_event.home_team = team.xpath('./team-metadata/name/@last')
    else
      new_event.away_location = team.xpath('./team-metadata/name/@first')
      new_event.away_team = team.xpath('./team-metadata/name/@last')
    end
  end
  
  new_event.spread = team.xpath('./wagering-stats/wagering-straight-spread[1]/@value')
  new_event.total_points = team.xpath('./wagering-stats/wagering-total-score[1]/@total')    
  new_event.save
  puts new_event.to_s
  puts "######################end item############################"
  
  
end

xml_doc = Nokogiri::XML(open(game_url, :http_basic_authentication => ["prosperitech", "l1v3l0ng"]))
xml_doc.xpath('//sports-event').each do |event|
  puts "$$$$$$$$$$$$$$$$$$$$$$$$$start item$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$"
  puts event.xpath('./event-metadata/@event-key')
  event.xpath('./team').each do |team|
    puts team.xpath('./team-metadata/name/@first')
    puts team.xpath('./team-metadata/name/@last')
    puts team.xpath('./team-stats/@score')
  end
  puts "$$$$$$$$$$$$$$$$$$$$$$$$$end item$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$"
end
