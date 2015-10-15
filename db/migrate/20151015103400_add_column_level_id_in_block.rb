class AddColumnLevelIdInBlock < ActiveRecord::Migration
  def change
    add_column :blocks, :level_id, :integer
    remove_column :blocks, :venue_id
  end
end
