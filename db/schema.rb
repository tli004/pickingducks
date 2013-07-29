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

ActiveRecord::Schema.define(:version => 20130719230827) do

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
    t.integer  "public_price",       :default => -1
    t.datetime "finished_at"
    t.integer  "resulting_bankroll"
    t.datetime "created_at",                           :null => false
    t.datetime "updated_at",                           :null => false
  end

  create_table "events", :force => true do |t|
    t.integer  "sport"
    t.float    "spread"
    t.float    "total_points"
    t.datetime "start_time"
    t.boolean  "live"
    t.boolean  "finished",     :default => false
    t.string   "home_team"
    t.string   "away_team"
    t.string   "extern_id"
    t.datetime "created_at",                      :null => false
    t.datetime "updated_at",                      :null => false
  end

  create_table "parlays", :force => true do |t|
    t.boolean  "pending"
    t.float    "amount"
    t.boolean  "winning"
    t.integer  "user_id"
    t.float    "resulting_bankroll"
    t.datetime "finished_at"
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
  end

  create_table "purchases", :force => true do |t|
    t.integer  "user_id"
    t.integer  "bet_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
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
    t.float    "win_percentage",           :default => 0.0
    t.integer  "losses",                   :default => 0
    t.integer  "ties",                     :default => 0
    t.float    "bankroll",                 :default => 100.0
    t.integer  "bankruptcies",             :default => 0
    t.string   "auth_token"
    t.string   "password_reset_token"
    t.datetime "password_reset_sent_at"
    t.datetime "created_at",                                  :null => false
    t.datetime "updated_at",                                  :null => false
    t.string   "profile_pic_file_name"
    t.string   "profile_pic_content_type"
    t.integer  "profile_pic_file_size"
    t.datetime "profile_pic_updated_at"
  end

end
