class CreateBlocks < ActiveRecord::Migration
  def change
    create_table :blocks do |t|
      t.integer :venue_id
      t.string :name
      t.integer :no_of_seats
      t.text :left
      t.text :right
      t.text :top_left
      t.text :top_right

      t.timestamps null: false
    end
  end
end
