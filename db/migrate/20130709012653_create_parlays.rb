class CreateParlays < ActiveRecord::Migration
  def change
    create_table :parlays do |t|
      
      t.boolean :open
      t.float :amount
      t.integer :user_id
      
      t.timestamps
    end
  end
end
