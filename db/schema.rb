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

ActiveRecord::Schema.define(version: 20131201212837) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "developers", force: true do |t|
    t.string   "name"
    t.string   "url"
    t.string   "description"
    t.string   "logo"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "name"
    t.string   "email"
    t.string   "token"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "password_hash"
    t.string   "password_salt"
  end

  create_table "votes", force: true do |t|
    t.integer  "value"
    t.integer  "user_id",     null: false
    t.integer  "wine_app_id", null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "wine_apps", force: true do |t|
    t.string "name"
    t.string "description"
  end

  add_index "wine_apps", ["name"], name: "index_wine_apps_on_name", using: :btree

end
