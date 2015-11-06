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

ActiveRecord::Schema.define(version: 20151106051052) do

  create_table "facial_hair", force: :cascade do |t|
    t.integer  "user_id",      limit: 4
    t.integer  "hair_length",  limit: 4
    t.datetime "last_trimmed"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "facial_hair", ["user_id", "last_trimmed"], name: "index_facial_hair_on_user_id_and_last_trimmed", using: :btree

  create_table "massage_types", force: :cascade do |t|
    t.string   "massage_type", limit: 255
    t.string   "length",       limit: 255
    t.decimal  "price",                    precision: 10
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "treatments", force: :cascade do |t|
    t.integer  "user_id",         limit: 4
    t.integer  "trim_type_id",    limit: 4
    t.integer  "massage_type_id", limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "trim_types", force: :cascade do |t|
    t.string   "trim_type",  limit: 255
    t.integer  "length",     limit: 4
    t.decimal  "price",                  precision: 10
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: :cascade do |t|
    t.string   "first_name", limit: 255
    t.string   "last_name",  limit: 255
    t.string   "email",      limit: 255
    t.string   "username",   limit: 255
    t.string   "password",   limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

end
