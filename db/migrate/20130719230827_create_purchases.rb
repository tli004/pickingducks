class CreatePurchases < ActiveRecord::Migration
  def change
    create_table :purchases do |t|
      
      t.integer :user_id
      t.integer :bet_id
      
      
      t.timestamps
    end
  end
end
