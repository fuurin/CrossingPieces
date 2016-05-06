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

ActiveRecord::Schema.define(version: 20160506124458) do

  create_table "articles", force: :cascade do |t|
    t.integer  "user_id",            limit: 4,        null: false
    t.integer  "category_id",        limit: 4,        null: false
    t.integer  "university_id",      limit: 4,        null: false
    t.string   "title",              limit: 255,      null: false
    t.datetime "updated_at",                          null: false
    t.binary   "photo",              limit: 16777215
    t.string   "photo_content_type", limit: 255
  end

  add_index "articles", ["university_id"], name: "fk_rails_d8d008214d", using: :btree
  add_index "articles", ["user_id"], name: "fk_rails_3d31dad1cc", using: :btree

  create_table "categories", force: :cascade do |t|
    t.string "en", limit: 255, null: false
    t.string "ja", limit: 255, null: false
  end

  create_table "contents", force: :cascade do |t|
    t.integer "article_id", limit: 4,     null: false
    t.integer "item_id",    limit: 4,     null: false
    t.text    "content",    limit: 65535
  end

  add_index "contents", ["article_id"], name: "index_contents_on_article_id", using: :btree
  add_index "contents", ["item_id"], name: "index_contents_on_item_id", using: :btree

  create_table "items", force: :cascade do |t|
    t.integer "category_id", limit: 4,                      null: false
    t.string  "name",        limit: 255,                    null: false
    t.string  "type",        limit: 255,   default: "text"
    t.boolean "mandatory",                 default: true
    t.text    "placeholder", limit: 65535
  end

  add_index "items", ["category_id"], name: "fk_rails_89fb86dc8b", using: :btree

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
    t.integer "university_id", limit: 4,                           null: false
    t.decimal "lat",                     precision: 20, scale: 17, null: false
    t.decimal "lng",                     precision: 20, scale: 17, null: false
    t.integer "zoom",          limit: 2,                           null: false
  end

  add_index "university_maps", ["university_id"], name: "fk_rails_f479d3627b", using: :btree

  create_table "university_photos", force: :cascade do |t|
    t.integer "university_id", limit: 4,        null: false
    t.binary  "photo",         limit: 16777215, null: false
    t.string  "content_type",  limit: 255,      null: false
    t.string  "name",          limit: 255
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

  add_foreign_key "articles", "universities"
  add_foreign_key "articles", "users"
  add_foreign_key "contents", "articles"
  add_foreign_key "contents", "items"
  add_foreign_key "items", "categories"
  add_foreign_key "university_maps", "universities"
end
