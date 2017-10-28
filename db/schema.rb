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

ActiveRecord::Schema.define(version: 20171026181139) do

  create_table "grid_colors", force: true do |t|
    t.string   "box_no"
    t.integer  "user_id"
    t.string   "color"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "grid_colors", ["user_id"], name: "index_grid_colors_on_user_id", using: :btree

  create_table "users", force: true do |t|
    t.string   "ip_add"
    t.string   "user_name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
