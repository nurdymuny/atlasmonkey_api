class AddLatLongToVenues < ActiveRecord::Migration
  def change
    add_column :venues, :start, :text
    add_column :venues, :end, :text
  end
end
