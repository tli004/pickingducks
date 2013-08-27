class CreatePurchases < ActiveRecord::Migration
  def change
    create_table :purchases do |t|
      
      t.integer :user_id
      t.integer :bet_id
      t.string :stripe_payment_token
      t.float :amount
      
      t.timestamps
    end
  end
end
