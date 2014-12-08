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

ActiveRecord::Schema.define(version: 20141208144948) do

  create_table "accesskeys", force: true do |t|
    t.string   "client_id"
    t.string   "client_secret"
    t.string   "callback_url"
    t.string   "source_url"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "instagram_arts", force: true do |t|
    t.text     "everything"
    t.string   "image_url"
    t.integer  "date_found"
    t.text     "tags"
    t.text     "caption"
    t.string   "user_name"
    t.string   "user_id"
    t.string   "user_avatar"
    t.string   "location_name"
    t.float    "longitude"
    t.float    "latitude"
    t.string   "location_id"
    t.string   "image_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "address"
  end

  create_table "locations", force: true do |t|
    t.string   "address"
    t.float    "latitude"
    t.float    "longitude"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
