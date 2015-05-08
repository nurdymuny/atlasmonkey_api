class CreateSeats < ActiveRecord::Migration
  def change
    create_table :seats do |t|
      t.integer :block_id
      t.string :seat_number
      t.float :latitude
      t.float :longitude

      t.timestamps null: false
    end
  end
end
