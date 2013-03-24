class CreateLines < ActiveRecord::Migration
  def up
    create_table :lines do |t|
      t.column :name, :string

      t.timestamps
    end
  end

  def down
    drop_table :lines
  end
end