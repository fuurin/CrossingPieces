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

ActiveRecord::Schema.define(version: 20160425134905) do

  create_table "universities", force: :cascade do |t|
    t.string   "name_en",           limit: 255,   null: false
    t.string   "name_ja",           limit: 255,   null: false
    t.string   "recommended_point", limit: 255,   null: false
    t.text     "comment",           limit: 65535, null: false
    t.integer  "created_by",        limit: 4,     null: false
    t.datetime "created_at",                      null: false
    t.integer  "updated_by",        limit: 4,     null: false
    t.datetime "updated_at",                      null: false
  end

  create_table "university_maps", force: :cascade do |t|
    t.integer "university_id", limit: 4,                null: false
    t.decimal "lat",                     precision: 10, null: false
    t.decimal "lng",                     precision: 10, null: false
  end

  add_index "university_maps", ["university_id"], name: "fk_rails_f479d3627b", using: :btree

  create_table "university_photos", force: :cascade do |t|
    t.integer "universities_id", limit: 4,        null: false
    t.binary  "photo",           limit: 16777215, null: false
    t.string  "content_type",    limit: 255,      null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  limit: 255,      default: "", null: false
    t.string   "encrypted_password",     limit: 255,      default: "", null: false
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          limit: 4,        default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",     limit: 255
    t.string   "last_sign_in_ip",        limit: 255
    t.datetime "created_at",                                           null: false
    t.datetime "updated_at",                                           null: false
    t.string   "name",                   limit: 255,                   null: false
    t.text     "comment",                limit: 65535,                 null: false
    t.string   "country_region",         limit: 255,                   null: false
    t.integer  "university_id",          limit: 4
    t.binary   "photo",                  limit: 16777215
    t.string   "photo_content_type",     limit: 255
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  add_foreign_key "university_maps", "universities"
end
