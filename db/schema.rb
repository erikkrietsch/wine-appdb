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

ActiveRecord::Schema.define(version: 20131205030945) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "bug_reports", force: true do |t|
    t.integer  "refid"
    t.string   "title"
    t.string   "description"
    t.string   "status"
    t.string   "resolution"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "bugs", force: true do |t|
    t.integer  "reference_id", null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "bugs", ["reference_id"], name: "index_bugs_on_reference_id", using: :btree

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
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.integer  "failed_attempts",        default: 0,  null: false
    t.string   "unlock_token"
    t.datetime "locked_at"
  end

  add_index "users", ["email"], name: "email_unique", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  create_table "votes", force: true do |t|
    t.integer  "value"
    t.integer  "user_id"
    t.integer  "wine_app_id", null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "wiki_entries", force: true do |t|
    t.integer  "wikiable_id"
    t.string   "wikiable_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "wine_apps", force: true do |t|
    t.string "name"
    t.string "description"
  end

  add_index "wine_apps", ["name"], name: "index_wine_apps_on_name", using: :btree

end
