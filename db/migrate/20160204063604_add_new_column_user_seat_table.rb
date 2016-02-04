class AddNewColumnUserSeatTable < ActiveRecord::Migration
  def change
    add_column :user_seat_allocates, :venue_id, :integer
    add_column :user_seat_allocates, :level_id, :integer
  end
end
