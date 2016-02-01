class AddNewColumnSeatLayoutTbl < ActiveRecord::Migration
  def change
    add_column :seat_layouts, :block_id, :integer
  end
end
