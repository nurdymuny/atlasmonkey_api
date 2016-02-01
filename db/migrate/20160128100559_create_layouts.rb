class CreateLayouts < ActiveRecord::Migration
  def change
    create_table :layouts do |t|
      t.integer :venue_id
      t.string :level_ids
      t.string :grid_size

      t.timestamps null: false
    end
  end
end
