class CreateCashouts < ActiveRecord::Migration
  def change
    create_table :cashouts do |t|

      t.integer :user_id
      t.integer :amount
      t.string :address1
      t.string :address2
      t.string :city
      t.string :state
      t.string :zip
      t.boolean :paid, :default => false
      
      t.timestamps
    end
  end
end
