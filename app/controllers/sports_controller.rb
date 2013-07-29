class SportsController < ApplicationController
  def sport_home
    @league_name = LEAGUE_NAMES[params[:sport_id].to_i-1]
    @events = Event.where(:sport => params[:sport_id], :finished => false)
  end
  
end
