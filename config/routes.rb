PickingDucks::Application.routes.draw do
  resources :sessions
  resources :events
  resources :bets 
  resources :users 
  resources :events do
    resources :bets
  end
  resources :password_resets
  resources :cashouts
  
  get "/how_to_play" => "application#how_to_play", :as => "how_to_play"
  get "/privacy" => "application#privacy", :as => "privacy"
  get "/terms_of_service" => "application#terms_of_service", :as => "terms_of_service"
  get "/about_us" => "application#about_us", :as => "about_us"
  
  get 'public_profile/:id' => "users#public_profile", :as => "public_profile"
  get 'pay_for_bet/:user_id/:bet_id' => "users#pay_for_bet", :as => "pay_for_bet"
  get 'pay_money_for_bet/:user_id/:bet_id' => "users#pay_money_for_bet", :as => "pay_money_for_bet"
  
  get "/sport/:sport_id" => "sports#sport_home", :as => "sport_home"
  
  get "/bets_home" => "bets#bets_home", :as => "bets_home"
  get "/make_parlay" => "bets#make_parlay", :as => "make_parlay"
  get "/request_cashout" => "users#request_cashout", :as => "request_cashout"
  post "/add_bets_to_parlay" => "bets#add_bets_to_parlay", :as => "add_bets_to_parlay"
  post '/make_bet_public/:id' => "bets#make_bet_public", :as => "make_bet_public"
  post '/buy_ducks' => "users#buy_duck", :as => "buy_ducks"
  post '/buy_bet_info' => "users#buy_bet_info", :as => "buy_bet_info"
  
  
  get "log_in" => "sessions#new", :as => "log_in"
  get "log_out" => "sessions#destroy", :as => "log_out"
  get "sign_up" => "user#new", :as => "sign_up"
  get "get_featured" => "home#get_featured", :as => "get_featured"
  root :to => "home#index"

end
