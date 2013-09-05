class SportsController < ApplicationController
  def sport_home
    @league_name = LEAGUE_NAMES[params[:sport_id].to_i-1]
    @events = Event.where("sport = ? and finished = false and start_time > ?", params[:sport_id], Time.zone.now)
  end
end
