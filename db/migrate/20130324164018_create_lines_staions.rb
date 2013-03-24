class CreateLinesStations < ActiveRecord::Migration
  def up
    create_table :lines_stations, :id => false do |t|
      t.column :station_id, :integer
      t.column :line_id, :integer
    end
  end

  def down
    drop_table :lines_stations
  end
end