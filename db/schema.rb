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

ActiveRecord::Schema.define(version: 20170201044146) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "letters", force: :cascade do |t|
    t.string   "user_uid"
    t.string   "letter_body"
    t.string   "status"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "politicians", force: :cascade do |t|
    t.string   "name"
    t.string   "party"
    t.string   "state"
    t.string   "image"
    t.string   "address"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "purchases", force: :cascade do |t|
    t.integer  "letter_id"
    t.string   "description"
    t.string   "to_name"
    t.string   "to_address_line"
    t.string   "to_address_city"
    t.string   "to_address_state"
    t.string   "to_address_country"
    t.string   "to_address_zip"
    t.string   "from_name"
    t.string   "from_address_line"
    t.string   "from_address_city"
    t.string   "from_address_state"
    t.string   "from_address_country"
    t.string   "from_address_zip"
    t.string   "file"
    t.string   "data"
    t.boolean  "color"
    t.string   "payment_status"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "uid"
    t.string   "email"
    t.string   "image"
    t.string   "address"
    t.string   "state"
    t.string   "zipcode"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
