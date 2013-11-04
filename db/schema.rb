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

ActiveRecord::Schema.define(version: 20131104152908) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "players", force: true do |t|
    t.string   "name"
    t.integer  "position_id"
    t.text     "skills"
    t.integer  "team_id"
    t.integer  "number"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "positions", force: true do |t|
    t.string   "name"
    t.integer  "st"
    t.integer  "ag"
    t.integer  "mv"
    t.integer  "av"
    t.integer  "cost"
    t.boolean  "journeyman_position", default: false, null: false
    t.text     "normal_skills"
    t.text     "double_skills"
    t.integer  "roster_id"
    t.integer  "maximum"
    t.text     "default_skills"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  create_table "rosters", force: true do |t|
    t.string   "name"
    t.integer  "reroll_cost"
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.string   "logo_path"
    t.boolean  "allow_apo",   default: true, null: false
  end

  create_table "teams", force: true do |t|
    t.string   "name"
    t.integer  "rerolls"
    t.integer  "assistant_coaches"
    t.integer  "cheerleaders"
    t.integer  "roster_id"
    t.datetime "created_at",                        null: false
    t.datetime "updated_at",                        null: false
    t.boolean  "apo",               default: false, null: false
    t.integer  "tv"
    t.integer  "fanfactor"
    t.integer  "gold"
  end

end
