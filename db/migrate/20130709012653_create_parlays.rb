class CreateParlays < ActiveRecord::Migration
  def change
    create_table :parlays do |t|
      
      t.boolean :pending
      t.float :amount
      t.boolean :winning
      t.integer :user_id
      t.float :resulting_bankroll
      t.datetime :finished_at
      
      t.timestamps
    end
  end
end
