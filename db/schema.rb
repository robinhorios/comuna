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

ActiveRecord::Schema.define(version: 20150302010404) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "categories", force: true do |t|
    t.string "name"
  end

  create_table "cells", force: true do |t|
    t.string   "name"
    t.string   "street"
    t.string   "number"
    t.string   "complement"
    t.string   "zipcode"
    t.string   "district"
    t.string   "city"
    t.integer  "state_id"
    t.integer  "categoty_id"
    t.string   "schedule"
    t.string   "host"
    t.string   "week_day"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "cells_users", force: true do |t|
    t.integer "cell_id"
    t.integer "user_id"
  end

  add_index "cells_users", ["cell_id"], name: "index_cells_users_on_cell_id", using: :btree
  add_index "cells_users", ["user_id"], name: "index_cells_users_on_user_id", using: :btree

  create_table "events", force: true do |t|
    t.string   "name"
    t.string   "event_day"
    t.string   "schedule"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "events_users", force: true do |t|
    t.integer "event_id"
    t.integer "user_id"
  end

  add_index "events_users", ["event_id"], name: "index_events_users_on_event_id", using: :btree
  add_index "events_users", ["user_id"], name: "index_events_users_on_user_id", using: :btree

  create_table "states", force: true do |t|
    t.string "name"
    t.string "acronym"
  end

  create_table "users", force: true do |t|
    t.string   "name"
    t.datetime "date_of_birth"
    t.string   "street"
    t.string   "number"
    t.string   "complement"
    t.string   "zipcode"
    t.string   "district"
    t.string   "city"
    t.integer  "state_id"
    t.string   "phone"
    t.string   "gender"
    t.integer  "spouse_id"
    t.boolean  "admin"
    t.boolean  "district_supervisor"
    t.boolean  "area_supervisor"
    t.boolean  "supervisor"
    t.boolean  "leader"
    t.boolean  "assist"
    t.boolean  "assist_in_training"
    t.boolean  "member"
    t.boolean  "member_away"
    t.boolean  "visitor"
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
  end

  add_index "users", ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true, using: :btree
  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
