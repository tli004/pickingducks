class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.integer :sport
      t.float :spread
      t.float :total_points
      t.datetime :start_time
      t.boolean :live
      t.boolean :finished, :default => false
      t.string :home_team
      t.string :away_team
      t.string :extern_id

      t.timestamps
    end
  end
end
