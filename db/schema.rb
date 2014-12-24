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

ActiveRecord::Schema.define(version: 20141223120137) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "presenters", force: true do |t|
    t.string   "name",       default: "", null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "nickname",   default: "", null: false
    t.string   "name",       default: "", null: false
    t.string   "image_url",  default: "", null: false
    t.string   "provider",                null: false
    t.string   "uid",                     null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "role",       default: 0,  null: false
  end

  add_index "users", ["provider"], name: "index_users_on_provider", using: :btree
  add_index "users", ["uid"], name: "index_users_on_uid", using: :btree

  create_table "videos", force: true do |t|
    t.string   "title",                default: "", null: false
    t.integer  "presenter_id",                      null: false
    t.datetime "originally_posted_on",              null: false
    t.string   "original_url",         default: "", null: false
    t.integer  "host",                 default: 0,  null: false
    t.string   "embed_url",            default: "", null: false
    t.integer  "status",               default: 0,  null: false
    t.string   "thumbnail",            default: "", null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "videos", ["presenter_id"], name: "index_videos_on_presenter_id", using: :btree
  add_index "videos", ["status"], name: "index_videos_on_status", using: :btree

end
