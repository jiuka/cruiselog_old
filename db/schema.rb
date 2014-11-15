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

ActiveRecord::Schema.define(version: 20141117185744) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"
  enable_extension "postgis"

# Could not dump table "cruise_sections" because of following StandardError
#   Unknown type 'geography(LineString,4326)' for column 'route'

  create_table "cruises", force: true do |t|
    t.string   "title"
    t.integer  "ship_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "cruises", ["ship_id"], name: "index_cruises_on_ship_id", using: :btree

  create_table "ports", force: true do |t|
    t.string   "title"
    t.string   "country",    limit: 2
    t.integer  "latlon",     limit: 0
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "ships", force: true do |t|
    t.string   "title"
    t.string   "line"
    t.integer  "port_of_registry_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "ships", ["port_of_registry_id"], name: "index_ships_on_port_of_registry_id", using: :btree

  create_table "spatial_ref_sys", primary_key: "srid", force: true do |t|
    t.string  "auth_name", limit: 256
    t.integer "auth_srid"
    t.string  "srtext",    limit: 2048
    t.string  "proj4text", limit: 2048
  end

  create_table "users", force: true do |t|
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
    t.string   "email",                          null: false
    t.string   "encrypted_password", limit: 128, null: false
    t.string   "confirmation_token", limit: 128
    t.string   "remember_token",     limit: 128, null: false
  end

  add_index "users", ["email"], name: "index_users_on_email", using: :btree
  add_index "users", ["remember_token"], name: "index_users_on_remember_token", using: :btree

end
