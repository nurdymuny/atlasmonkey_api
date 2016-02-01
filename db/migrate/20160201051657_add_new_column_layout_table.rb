class AddNewColumnLayoutTable < ActiveRecord::Migration
  def change
    add_column :layouts, :seat_layout_ids, :string
  end
end
