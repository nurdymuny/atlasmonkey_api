class ChangeColumnLayoutTableType < ActiveRecord::Migration
  def change
    change_column :layouts, :seat_layout_ids, :text
  end
end
