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

ActiveRecord::Schema.define(version: 20171030144913) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "complete_prefectures", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "prefecture_id"
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
    t.boolean  "complete",      default: false
    t.integer  "number",        default: 0
  end

  add_index "complete_prefectures", ["prefecture_id"], name: "index_complete_prefectures_on_prefecture_id", using: :btree
  add_index "complete_prefectures", ["user_id", "prefecture_id"], name: "index_complete_prefectures_on_user_id_and_prefecture_id", unique: true, using: :btree
  add_index "complete_prefectures", ["user_id"], name: "index_complete_prefectures_on_user_id", using: :btree

  create_table "complete_routes", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "route_id"
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.boolean  "complete",   default: false
    t.integer  "number",     default: 0
  end

  add_index "complete_routes", ["route_id"], name: "index_complete_routes_on_route_id", using: :btree
  add_index "complete_routes", ["user_id", "route_id"], name: "index_complete_routes_on_user_id_and_route_id", unique: true, using: :btree
  add_index "complete_routes", ["user_id"], name: "index_complete_routes_on_user_id", using: :btree

  create_table "prefecture_comments", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "prefecture_id"
    t.text     "content"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  add_index "prefecture_comments", ["prefecture_id"], name: "index_prefecture_comments_on_prefecture_id", using: :btree
  add_index "prefecture_comments", ["user_id"], name: "index_prefecture_comments_on_user_id", using: :btree

  create_table "prefectures", force: :cascade do |t|
    t.integer  "number"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "name"
  end

  create_table "route_comments", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "route_id"
    t.text     "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "route_comments", ["route_id"], name: "index_route_comments_on_route_id", using: :btree
  add_index "route_comments", ["user_id"], name: "index_route_comments_on_user_id", using: :btree

  create_table "routes", force: :cascade do |t|
    t.integer  "number"
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.string   "name"
    t.boolean  "active",     default: true
  end

  create_table "rs_relationships", force: :cascade do |t|
    t.integer  "station_id"
    t.integer  "route_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "rs_relationships", ["route_id"], name: "index_rs_relationships_on_route_id", using: :btree
  add_index "rs_relationships", ["station_id", "route_id"], name: "index_rs_relationships_on_station_id_and_route_id", unique: true, using: :btree
  add_index "rs_relationships", ["station_id"], name: "index_rs_relationships_on_station_id", using: :btree

  create_table "station_comments", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "station_id"
    t.text     "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "station_comments", ["station_id"], name: "index_station_comments_on_station_id", using: :btree
  add_index "station_comments", ["user_id"], name: "index_station_comments_on_user_id", using: :btree

  create_table "stations", force: :cascade do |t|
    t.integer  "prefecture_id"
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
    t.string   "name"
    t.boolean  "active",        default: true
  end

  create_table "us_relationships", force: :cascade do |t|
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "station_id"
  end

  add_index "us_relationships", ["station_id"], name: "index_us_relationships_on_station_id", using: :btree
  add_index "us_relationships", ["user_id", "station_id"], name: "index_us_relationships_on_user_id_and_station_id", unique: true, using: :btree
  add_index "us_relationships", ["user_id"], name: "index_us_relationships_on_user_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "",    null: false
    t.string   "encrypted_password",     default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.string   "name"
    t.string   "vio",                    default: ""
    t.string   "uid",                    default: "",    null: false
    t.string   "provider",               default: "",    null: false
    t.string   "image_url"
    t.string   "avatar"
    t.boolean  "admin",                  default: false
    t.string   "token",                  default: "",    null: false
    t.string   "sercret",                default: "",    null: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  add_index "users", ["uid", "provider"], name: "index_users_on_uid_and_provider", unique: true, using: :btree

  add_foreign_key "prefecture_comments", "prefectures"
  add_foreign_key "prefecture_comments", "users"
  add_foreign_key "route_comments", "routes"
  add_foreign_key "route_comments", "users"
  add_foreign_key "station_comments", "stations"
  add_foreign_key "station_comments", "users"
end
