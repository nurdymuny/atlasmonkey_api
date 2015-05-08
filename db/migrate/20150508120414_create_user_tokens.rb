class CreateUserTokens < ActiveRecord::Migration
  def change
    create_table :user_tokens do |t|
      t.references :user, index: true
      t.text :auth_token

      t.timestamps null: false
    end
    add_foreign_key :user_tokens, :users
  end
end
