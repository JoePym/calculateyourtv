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

ActiveRecord::Schema.define(version: 20131107180346) do

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

  create_table "players_skills", force: true do |t|
    t.integer "player_id"
    t.integer "skill_id"
  end

  add_index "players_skills", ["player_id"], name: "index_players_skills_on_player_id", using: :btree
  add_index "players_skills", ["skill_id"], name: "index_players_skills_on_skill_id", using: :btree

  create_table "positions", force: true do |t|
    t.string   "name"
    t.integer  "st"
    t.integer  "ag"
    t.integer  "ma"
    t.integer  "av"
    t.integer  "cost"
    t.boolean  "journeyman_position", default: false, null: false
    t.integer  "roster_id"
    t.integer  "maximum"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  create_table "positions_skills", force: true do |t|
    t.integer "skill_id"
    t.integer "position_id"
  end

  create_table "rosters", force: true do |t|
    t.string   "name"
    t.integer  "reroll_cost"
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.string   "logo_path"
    t.boolean  "allow_apo",   default: true, null: false
  end

  create_table "skill_accesses", force: true do |t|
    t.integer  "skill_category_id"
    t.integer  "position_id"
    t.boolean  "normal",            default: false, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "skill_categories", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "skills", force: true do |t|
    t.string   "name"
    t.integer  "skill_category_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "skills", ["skill_category_id"], name: "index_skills_on_skill_category_id", using: :btree

  create_table "teams", force: true do |t|
    t.string   "name"
    t.integer  "rerolls"
    t.integer  "assistant_coaches", default: 0
    t.integer  "cheerleaders",      default: 0
    t.integer  "roster_id"
    t.datetime "created_at",                        null: false
    t.datetime "updated_at",                        null: false
    t.boolean  "apo",               default: false, null: false
    t.integer  "tv"
    t.integer  "fanfactor",         default: 0
    t.integer  "gold",              default: 0
  end

end
