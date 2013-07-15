class HomeController < ApplicationController
  require 'nokogiri'
  require 'open-uri'
  
  def index
    @user = User.new if current_user.nil?
    @top_ten = User.order('bankroll DESC').limit(10)
    if params[:sport_id]
      @selected_sport = SPORTS_NAMES[params[:sport_id].to_i-1]
    else 
      @selected_sport = "Football"
    end
    
    sport_id = params[:sport_id] || 1
    
    @featured = Event.where('start_time BETWEEN ? AND ? AND sport = ?', DateTime.now.beginning_of_day, DateTime.now.end_of_day, sport_id).limit(5);
  end
  
  def get_featured
    @featured = Event.where('start_time BETWEEN ? AND ? AND sport = ?', DateTime.now.beginning_of_day, DateTime.now.end_of_day, params[:sport_id]).limit(5);
    @selected_sport = SPORTS_NAMES[params[:sport_id].to_i-1]
    render "events/featured_games.js.erb"
  end  
end
