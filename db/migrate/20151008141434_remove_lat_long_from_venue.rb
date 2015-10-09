class RemoveLatLongFromVenue < ActiveRecord::Migration
  def change
    remove_column :venues, :start
    remove_column :venues, :end
  end
end
