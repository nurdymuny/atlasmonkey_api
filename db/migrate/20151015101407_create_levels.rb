class CreateLevels < ActiveRecord::Migration
  def change
    create_table :levels do |t|
      t.string :name
      t.integer :venue_id

      t.timestamps null: false
    end
  end
end
