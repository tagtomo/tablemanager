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

ActiveRecord::Schema.define(version: 20140714090536) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "tm_table_columns", force: true do |t|
    t.integer  "column_number"
    t.string   "column_name"
    t.string   "column_name_jp"
    t.string   "column_type"
    t.string   "column_size"
    t.boolean  "column_null"
    t.string   "column_default"
    t.boolean  "column_p_key"
    t.boolean  "column_f_key"
    t.text     "note"
    t.integer  "tm_table_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "tm_tables", force: true do |t|
    t.string   "project_name"
    t.string   "table_name"
    t.string   "table_name_jp"
    t.string   "revision_number"
    t.text     "note"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
