class XMLParser
  require 'nokogiri'
  require 'open-uri'
  
  def get_nba_events
    url = "http://api.pinnaclesports.com/v1/feed?sportid=4&leagueid=487&clientid=CB524717&apikey=8f9f9848-44c3-4e2d-9888-045e8f042c0c&oddsformat=0"
    
    xml_doc = Nokogiri::XML(open(url))
    #puts xml_doc.to_xml
    xml_doc.xpath('//event').each do |item|
      event = Event.new
      event.sport = 4
      event.extern_id = item.xpath('./id/text()').to_s
      event.home = item.xpath('./homeTeam/name/text()').to_s
      event.away =  item.xpath('./awayTeam/name/text()').to_s
      event.start_time = DateTime.strptime(item.xpath('./startDateTime/text()').to_s, '%Y-%m-%dT%H:%M:%S%Z')
      event.spread = item.xpath('.//period/number[contains(text(), "0")]/..//spread[1]/awaySpread/text()').to_f
    end
  end
end