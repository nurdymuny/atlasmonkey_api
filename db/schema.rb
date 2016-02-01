# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20160201051657) do

  create_table "blocks", force: :cascade do |t|
    t.string   "name",        limit: 255
    t.integer  "no_of_seats", limit: 4
    t.text     "left",        limit: 65535
    t.text     "right",       limit: 65535
    t.text     "top_left",    limit: 65535
    t.text     "top_right",   limit: 65535
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.integer  "level_id",    limit: 4
  end

  create_table "lat_longs", force: :cascade do |t|
    t.text     "start",          limit: 65535
    t.text     "end",            limit: 65535
    t.integer  "placeable_id",   limit: 4
    t.string   "placeable_type", limit: 255
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
  end

  create_table "layouts", force: :cascade do |t|
    t.integer  "venue_id",        limit: 4
    t.string   "level_ids",       limit: 255
    t.string   "grid_size",       limit: 255
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.string   "seat_layout_ids", limit: 255
  end

  create_table "levels", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.integer  "venue_id",   limit: 4
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "seat_layouts", force: :cascade do |t|
    t.integer  "layout_id",   limit: 4
    t.integer  "level_id",    limit: 4
    t.integer  "venue_id",    limit: 4
    t.integer  "x_grid_ref",  limit: 4
    t.integer  "y_grid_ref",  limit: 4
    t.integer  "seat_number", limit: 4
    t.string   "uuid_number", limit: 255
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.integer  "block_id",    limit: 4
  end

  create_table "seats", force: :cascade do |t|
    t.integer  "block_id",    limit: 4
    t.string   "seat_number", limit: 255
    t.decimal  "latitude",                precision: 20, scale: 15
    t.decimal  "longitude",               precision: 20, scale: 15
    t.datetime "created_at",                                        null: false
    t.datetime "updated_at",                                        null: false
    t.integer  "user_id",     limit: 4
  end

  create_table "tickets", force: :cascade do |t|
    t.string   "unique_ticket_id", limit: 255
    t.integer  "seat_id",          limit: 4
    t.integer  "block_id",         limit: 4
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
  end

  create_table "user_tokens", force: :cascade do |t|
    t.integer  "user_id",    limit: 4
    t.text     "auth_token", limit: 65535
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  add_index "user_tokens", ["user_id"], name: "index_user_tokens_on_user_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "email",                  limit: 255, default: "",    null: false
    t.string   "encrypted_password",     limit: 255, default: "",    null: false
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          limit: 4,   default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",     limit: 255
    t.string   "last_sign_in_ip",        limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "is_admin",               limit: 1,   default: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  create_table "venues", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.text     "location",   limit: 65535
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  add_foreign_key "user_tokens", "users"
end
