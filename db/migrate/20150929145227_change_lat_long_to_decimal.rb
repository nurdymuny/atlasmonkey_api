class ChangeLatLongToDecimal < ActiveRecord::Migration
  def change
    change_column :seats, :latitude, :decimal, :precision => 20, :scale => 15
    change_column :seats, :longitude, :decimal, :precision => 20, :scale => 15
  end
end
