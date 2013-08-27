class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :username      
      t.string :pwd_salt
      t.string :pwd_hash
      t.string :email
      t.string :first_name
      t.string :last_name
      t.text :bio
      t.datetime :dob
      t.boolean :active
      t.string :secret_question
      t.string :secret_answer
      t.datetime :banned_until
      t.boolean :accept_terms
      t.integer :wins, :default => 0
      t.integer :losses, :default => 0
      t.integer :ties, :default => 0
      t.integer :nfl_wins, :default => 0
      t.integer :nfl_losses, :default => 0
      t.integer :nfl_ties, :default => 0
      t.integer :nba_wins, :default => 0
      t.integer :nba_losses, :default => 0
      t.integer :nba_ties, :default => 0
      t.integer :mlb_wins, :default => 0
      t.integer :mlb_losses, :default => 0
      t.integer :mlb_ties, :default => 0
      t.integer :nhl_wins, :default => 0
      t.integer :nhl_losses, :default => 0
      t.integer :nhl_ties, :default => 0
      t.float :win_percentage, :default => 0
      t.float :nfl_win_percentage, :default => 0
      t.float :nba_win_percentage, :default => 0
      t.float :mlb_win_percentage, :default => 0
      t.float :nhl_win_percentage, :default => 0      
      t.float :bankroll, :default => 100.00
      t.float :money, :default => 0.0
      t.integer :resets, :default => 0
      
      t.boolean :registered
      t.string :address1
      t.string :address2
      t.string :city
      t.string :state
      t.string :zip
      
      t.string :auth_token
      t.string :password_reset_token
      t.datetime :password_reset_sent_at
      
      t.timestamps
    end
    
    add_attachment :users, :profile_pic
    
  end
end
