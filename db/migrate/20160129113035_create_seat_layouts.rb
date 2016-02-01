class CreateSeatLayouts < ActiveRecord::Migration
  def change
    create_table :seat_layouts do |t|
      t.integer :layout_id
      t.integer :level_id
      t.integer :venue_id
      t.integer :x_grid_ref
      t.integer :y_grid_ref
      t.integer :seat_number
      t.string :uuid_number

      t.timestamps null: false
    end
  end
end
