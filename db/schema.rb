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

ActiveRecord::Schema.define(version: 20170818182131) do

  create_table "attendances", force: :cascade do |t|
    t.string   "entity_type"
    t.integer  "entity_id"
    t.boolean  "status"
    t.date     "for"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "divisions", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "staffs", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.date     "dob"
    t.string   "gender"
    t.integer  "division_id"
    t.string   "email_id"
    t.string   "password"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "staffs", ["division_id"], name: "index_staffs_on_division_id"

  create_table "students", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.date     "dob"
    t.integer  "division_id"
    t.string   "gender"
    t.string   "parent_guardian_name"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  add_index "students", ["division_id"], name: "index_students_on_division_id"

end
