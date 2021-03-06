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

ActiveRecord::Schema.define(version: 20140224232014) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "bug_reports", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "bug_id"
  end

  create_table "developers", force: true do |t|
    t.string   "name"
    t.string   "url"
    t.string   "description"
    t.string   "logo"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "problem_entries", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "screenshots", force: true do |t|
    t.integer  "wine_app_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.string   "title"
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
    t.integer  "user_id"
    t.integer  "wine_app_id",      null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "ip_address"
    t.integer  "difficulty_value"
    t.integer  "quality_value"
  end

  add_index "votes", ["ip_address"], name: "index_votes_on_ip_address", using: :btree
  add_index "votes", ["user_id"], name: "index_votes_on_user_id", using: :btree
  add_index "votes", ["wine_app_id"], name: "index_votes_on_wine_app_id", using: :btree

  create_table "wiki_entries", force: true do |t|
    t.integer  "wikiable_id"
    t.string   "wikiable_type"
    t.integer  "user_id"
    t.text     "content"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "wiki_type"
  end

  create_table "wine_app_categories", force: true do |t|
    t.string   "name"
    t.integer  "wine_app_categories_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "wine_app_problems", force: true do |t|
    t.integer  "wine_app_id"
    t.integer  "bug_report_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "wine_version_id"
  end

  create_table "wine_apps", force: true do |t|
    t.string "name"
  end

  add_index "wine_apps", ["name"], name: "index_wine_apps_on_name", using: :btree

end
