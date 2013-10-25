# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20130819004330) do

  create_table "bets", :force => true do |t|
    t.integer  "user_id"
    t.integer  "event_id"
    t.integer  "parlay_id"
    t.boolean  "parlay"
    t.float    "amount"
    t.string   "bet_type"
    t.integer  "sport"
    t.boolean  "pending",            :default => true, :null => false
    t.boolean  "winning"
    t.integer  "money_price",        :default => -1
    t.datetime "closed_at"
    t.integer  "resulting_bankroll"
    t.datetime "created_at",                           :null => false
    t.datetime "updated_at",                           :null => false
  end

  create_table "cashouts", :force => true do |t|
    t.integer  "user_id"
    t.integer  "amount"
    t.string   "address1"
    t.string   "address2"
    t.string   "city"
    t.string   "state"
    t.string   "zip"
    t.boolean  "paid",       :default => false
    t.datetime "created_at",                    :null => false
    t.datetime "updated_at",                    :null => false
  end

  create_table "events", :force => true do |t|
    t.integer  "sport"
    t.float    "spread"
    t.float    "moneyline_home"
    t.float    "moneyline_away"
    t.float    "total_points"
    t.integer  "home_total",     :default => 0
    t.integer  "away_total",     :default => 0
    t.datetime "start_time"
    t.boolean  "live"
    t.boolean  "finished",       :default => false
    t.string   "home_team"
    t.string   "home_location"
    t.string   "away_team"
    t.string   "away_location"
    t.string   "extern_id"
    t.datetime "created_at",                        :null => false
    t.datetime "updated_at",                        :null => false
  end

  create_table "parlays", :force => true do |t|
    t.boolean  "pending"
    t.float    "amount"
    t.boolean  "winning"
    t.integer  "user_id"
    t.float    "resulting_bankroll"
    t.datetime "closed_at"
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
  end

  create_table "purchases", :force => true do |t|
    t.integer  "user_id"
    t.integer  "bet_id"
    t.string   "stripe_payment_token"
    t.float    "amount"
    t.datetime "created_at",           :null => false
    t.datetime "updated_at",           :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "username"
    t.string   "pwd_salt"
    t.string   "pwd_hash"
    t.string   "email"
    t.string   "first_name"
    t.string   "last_name"
    t.text     "bio"
    t.datetime "dob"
    t.boolean  "active"
    t.string   "secret_question"
    t.string   "secret_answer"
    t.datetime "banned_until"
    t.boolean  "accept_terms"
    t.integer  "wins",                     :default => 0
    t.integer  "losses",                   :default => 0
    t.integer  "ties",                     :default => 0
    t.integer  "nfl_wins",                 :default => 0
    t.integer  "nfl_losses",               :default => 0
    t.integer  "nfl_ties",                 :default => 0
    t.integer  "nba_wins",                 :default => 0
    t.integer  "nba_losses",               :default => 0
    t.integer  "nba_ties",                 :default => 0
    t.integer  "mlb_wins",                 :default => 0
    t.integer  "mlb_losses",               :default => 0
    t.integer  "mlb_ties",                 :default => 0
    t.integer  "nhl_wins",                 :default => 0
    t.integer  "nhl_losses",               :default => 0
    t.integer  "nhl_ties",                 :default => 0
    t.float    "win_percentage",           :default => 0.0
    t.float    "nfl_win_percentage",       :default => 0.0
    t.float    "nba_win_percentage",       :default => 0.0
    t.float    "mlb_win_percentage",       :default => 0.0
    t.float    "nhl_win_percentage",       :default => 0.0
    t.float    "bankroll",                 :default => 1000.0
    t.float    "available_bankroll",       :default => 1000.0
    t.float    "money",                    :default => 0.0
    t.integer  "resets",                   :default => 0
    t.boolean  "registered"
    t.string   "address1"
    t.string   "address2"
    t.string   "city"
    t.string   "state"
    t.string   "zip"
    t.string   "auth_token"
    t.string   "password_reset_token"
    t.datetime "password_reset_sent_at"
    t.datetime "created_at",                                   :null => false
    t.datetime "updated_at",                                   :null => false
    t.string   "profile_pic_file_name"
    t.string   "profile_pic_content_type"
    t.integer  "profile_pic_file_size"
    t.datetime "profile_pic_updated_at"
  end

end
