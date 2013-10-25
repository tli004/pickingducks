class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.integer :sport
      t.float :spread
      t.float :moneyline_home
      t.float :moneyline_away
      t.float :total_points
      t.integer :home_total, :default => 0
      t.integer :away_total, :default => 0
      t.datetime :start_time
      t.boolean :live
      t.boolean :finished, :default => false
      t.string :home_team
      t.string :home_location
      t.string :away_team
      t.string :away_location
      t.string :extern_id

      t.timestamps
    end
  end
end
