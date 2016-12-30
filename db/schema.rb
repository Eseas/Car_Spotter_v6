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

ActiveRecord::Schema.define(version: 20161126195046) do

  create_table "car_details", force: :cascade do |t|
    t.integer  "car_id"
    t.string   "make"
    t.string   "model"
    t.string   "year"
    t.string   "lic"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["car_id"], name: "index_car_details_on_car_id"
  end

  create_table "cars", force: :cascade do |t|
    t.integer "session_id"
    t.text    "comment"
    t.index ["session_id"], name: "index_cars_on_session_id"
  end

  create_table "credentials", force: :cascade do |t|
    t.integer "session_id"
    t.string  "password"
    t.index ["session_id"], name: "index_credentials_on_session_id"
  end

  create_table "customer_details", force: :cascade do |t|
    t.integer "session_id"
    t.string  "email"
    t.string  "name"
    t.string  "surname"
    t.index ["session_id"], name: "index_customer_details_on_session_id"
  end

  create_table "customers", force: :cascade do |t|
    t.integer "session_id"
    t.float   "bill"
    t.integer "credit"
    t.integer "max_photo"
    t.index ["session_id"], name: "index_customers_on_session_id"
  end

  create_table "photos", force: :cascade do |t|
    t.integer "car_id"
    t.string  "filename"
    t.index ["car_id"], name: "index_photos_on_car_id"
  end

  create_table "sessions", force: :cascade do |t|
    t.string   "username"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
