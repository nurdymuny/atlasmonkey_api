class AddUserIdToSeats < ActiveRecord::Migration
  def change
    add_column :seats, :user_id, :integer
  end
end
