class CreateStations < ActiveRecord::Migration
  def up
    create_table :stations do |t|
      t.column :name, :string

      t.timestamps
    end
  end

  def down
    drop_table :stations
  end
end