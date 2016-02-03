class CreateUserSeatAllocates < ActiveRecord::Migration
  def change
    create_table :user_seat_allocates do |t|
      t.integer :seat_id
      t.integer :user_id
      t.integer :x_grid
      t.integer :y_grid
      t.integer :block_id
      t.string :uuid_number

      t.timestamps null: false
    end
  end
end
