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
      t.float :bankroll, :default => 100.00
      t.integer :bankruptcies, :default => 0
      
      t.string :auth_token
      t.string :password_reset_token
      t.datetime :password_reset_sent_at
      
      t.timestamps
    end
    
    add_attachment :users, :profile_pic
    
  end
end
