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

ActiveRecord::Schema.define(version: 20140505213721) do

  create_table "authors", force: true do |t|
    t.string "name"
    t.string "catalog_link"
  end

  add_index "authors", ["name"], name: "index_authors_on_name", unique: true

  create_table "daily_offers", force: true do |t|
    t.string  "title",          null: false
    t.string  "image_path",     null: false
    t.string  "offer_link",     null: false
    t.string  "price",          null: false
    t.integer "author_id"
    t.integer "derby_entry_id"
  end

  create_table "derbies", force: true do |t|
    t.integer  "derby_id",                 null: false
    t.datetime "begin_at",                 null: false
    t.datetime "end_at",                   null: false
    t.string   "title",                    null: false
    t.boolean  "open",     default: false
  end

  add_index "derbies", ["derby_id"], name: "index_derbies_on_derby_id"

  create_table "derby_entries", force: true do |t|
    t.string   "entry_id",                   null: false
    t.string   "title",                      null: false
    t.string   "image_path",                 null: false
    t.boolean  "fog_of_war", default: false
    t.integer  "vote_count", default: 0
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "derby_id"
    t.boolean  "active",     default: true
    t.string   "entry_link"
  end

  add_index "derby_entries", ["entry_id"], name: "index_derby_entries_on_entry_id"

  create_table "derby_entries_voters", id: false, force: true do |t|
    t.integer "derby_entry_id", null: false
    t.integer "voter_id",       null: false
  end

  create_table "voters", force: true do |t|
    t.string   "email",      null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
