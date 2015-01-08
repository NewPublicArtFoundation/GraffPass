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

ActiveRecord::Schema.define(version: 20150108215327) do

  create_table "accesskeys", force: true do |t|
    t.string   "client_id"
    t.string   "client_secret"
    t.string   "callback_url"
    t.string   "source_url"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "geodata", force: true do |t|
    t.string   "purpose"
    t.text     "content"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "identities", force: true do |t|
    t.integer  "user_id"
    t.string   "provider"
    t.string   "uid"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "identities", ["user_id"], name: "index_identities_on_user_id"

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
    t.string   "uid"
    t.boolean  "flagged"
  end

  add_index "instagram_arts", ["uid"], name: "index_instagram_arts_on_uid", unique: true

  create_table "locations", force: true do |t|
    t.string   "address"
    t.float    "latitude"
    t.float    "longitude"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "rate_of_hashes", force: true do |t|
    t.text     "day_of"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "email",                  default: "", null: false
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
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name"
  end

  add_index "users", ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
