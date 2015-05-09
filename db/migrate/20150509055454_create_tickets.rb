class CreateTickets < ActiveRecord::Migration
  def change
    create_table :tickets do |t|
      t.string :unique_ticket_id
      t.integer :seat_id
      t.integer :block_id
      t.timestamps null: false
    end
  end
end
