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

ActiveRecord::Schema.define(version: 20141122183949) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"
  enable_extension "postgis"

  create_table "cruise_segments", force: true do |t|
    t.integer  "cruise_id"
    t.integer  "from_id"
    t.integer  "to_id"
    t.spatial  "route",      limit: {:srid=>4326, :type=>"line_string", :geographic=>true}
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "slug"
    t.datetime "leave"
    t.datetime "arrive"
  end

  add_index "cruise_segments", ["cruise_id"], :name => "index_cruise_segments_on_cruise_id"
  add_index "cruise_segments", ["from_id"], :name => "index_cruise_segments_on_from_id"
  add_index "cruise_segments", ["slug", "cruise_id"], :name => "index_cruise_segments_on_slug_and_cruise_id", :unique => true
  add_index "cruise_segments", ["to_id"], :name => "index_cruise_segments_on_to_id"

  create_table "cruises", force: true do |t|
    t.string   "title"
    t.integer  "ship_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "slug"
  end

  add_index "cruises", ["ship_id"], :name => "index_cruises_on_ship_id"
  add_index "cruises", ["slug"], :name => "index_cruises_on_slug", :unique => true

  create_table "lines", force: true do |t|
    t.string   "title"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "slug"
  end

  add_index "lines", ["slug"], :name => "index_lines_on_slug", :unique => true

  create_table "port_of_calls", force: true do |t|
    t.integer  "ship_id"
    t.integer  "port_id"
    t.datetime "arrive"
    t.datetime "leave"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.date     "orderdate"
  end

  add_index "port_of_calls", ["port_id"], :name => "index_port_of_calls_on_port_id"
  add_index "port_of_calls", ["ship_id"], :name => "index_port_of_calls_on_ship_id"

  create_table "ports", force: true do |t|
    t.string   "title"
    t.string   "country",    limit: 2
    t.spatial  "location",   limit: {:srid=>4326, :type=>"point", :geographic=>true}
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "slug"
  end

  add_index "ports", ["slug"], :name => "index_ports_on_slug", :unique => true

  create_table "ships", force: true do |t|
    t.string   "title"
    t.integer  "line_id"
    t.integer  "port_of_origin_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "slug"
  end

  add_index "ships", ["line_id"], :name => "index_ships_on_line_id"
  add_index "ships", ["port_of_origin_id"], :name => "index_ships_on_port_of_origin_id"
  add_index "ships", ["slug"], :name => "index_ships_on_slug", :unique => true

  create_table "users", force: true do |t|
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
    t.string   "email",                          null: false
    t.string   "encrypted_password", limit: 128, null: false
    t.string   "confirmation_token", limit: 128
    t.string   "remember_token",     limit: 128, null: false
  end

  add_index "users", ["email"], :name => "index_users_on_email"
  add_index "users", ["remember_token"], :name => "index_users_on_remember_token"

end
