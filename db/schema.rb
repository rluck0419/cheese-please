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

ActiveRecord::Schema.define(version: 20160802185002) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "cheeses", force: :cascade do |t|
    t.string   "name"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_cheeses_on_user_id", using: :btree
  end

  create_table "user_cheeses", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "cheese_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["cheese_id"], name: "index_user_cheeses_on_cheese_id", using: :btree
    t.index ["user_id"], name: "index_user_cheeses_on_user_id", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string   "email"
    t.string   "password_digest"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_foreign_key "cheeses", "users"
  add_foreign_key "user_cheeses", "cheeses"
  add_foreign_key "user_cheeses", "users"
end