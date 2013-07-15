PickingDucks::Application.routes.draw do
  
  

  resources :sessions
  resources :events
  resources :bets
  resources :users
  resources :events do
    resources :bets
  end
  resources :password_resets
  
  get "/how_to_play" => "application#how_to_play", :as => "how_to_play"
  get "/privacy" => "application#privacy", :as => "privacy"
  get "/terms_of_service" => "application#terms_of_service", :as => "terms_of_service"
  
  get "/sport/:sport_id" => "sports#sport_home", :as => "sport_home"
  
  get "/bets_home" => "bets#bets_home", :as => "bets_home"
  get "/make_parlay" => "bets#make_parlay", :as => "make_parlay"
  post "/add_bets_to_parlay" => "bets#add_bets_to_parlay", :as => "add_bets_to_parlay"
  
  get "log_in" => "sessions#new", :as => "log_in"
  get "log_out" => "sessions#destroy", :as => "log_out"
  get "sign_up" => "user#new", :as => "sign_up"
  get "get_featured" => "home#get_featured", :as => "get_featured"
  root :to => "home#index"

end
