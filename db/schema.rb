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

ActiveRecord::Schema.define(version: 20150716205414) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "foursquares", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "meals", force: :cascade do |t|
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "meals", ["user_id"], name: "index_meals_on_user_id", using: :btree

  create_table "selections", force: :cascade do |t|
    t.boolean  "healthy"
    t.boolean  "spicy"
    t.boolean  "cheese"
    t.boolean  "sandwiches"
    t.boolean  "tacos"
    t.boolean  "asian"
    t.boolean  "fusion"
    t.boolean  "bbq"
    t.boolean  "dessert"
    t.boolean  "burgers"
    t.boolean  "fried"
    t.boolean  "seafood"
    t.string   "price"
    t.string   "distance"
    t.boolean  "take_out"
    t.boolean  "outdoor_seating"
    t.boolean  "serves_alcohol"
    t.integer  "meal_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.string   "lat"
    t.string   "long"
  end

  add_index "selections", ["meal_id"], name: "index_selections_on_meal_id", using: :btree

  create_table "users", force: :cascade do |t|
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
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  add_foreign_key "meals", "users"
  add_foreign_key "selections", "meals"
end
