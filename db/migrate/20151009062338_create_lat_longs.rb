class CreateLatLongs < ActiveRecord::Migration
  def change
    create_table :lat_longs do |t|
      t.text :start
      t.text :end
      t.integer :placeable_id
      t.string :placeable_type

      t.timestamps null: false
    end
  end
end
