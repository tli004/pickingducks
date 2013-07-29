class CreateBets < ActiveRecord::Migration
  def change
    create_table :bets do |t|
      t.integer :user_id
      t.integer :event_id
      t.integer :parlay_id
      t.boolean :parlay
      t.float :amount
      t.string :bet_type
      t.integer :sport
      t.boolean :pending, :default => true, :null => false
      t.boolean :winning
      t.integer :public_price, :default => -1
      t.datetime :finished_at
      t.integer :resulting_bankroll
      
      t.timestamps
    end
  end
end
