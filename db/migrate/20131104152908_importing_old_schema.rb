class ImportingOldSchema < ActiveRecord::Migration
  def change
    create_table "players", :force => true do |t|
      t.string   "name"
      t.integer  "position_id"
      t.text     "skills"
      t.integer  "team_id"
      t.integer  "number"
      t.datetime "created_at",  :null => false
      t.datetime "updated_at",  :null => false
    end

    create_table "positions", :force => true do |t|
      t.string   "name"
      t.integer  "st"
      t.integer  "ag"
      t.integer  "mv"
      t.integer  "av"
      t.integer  "cost"
      t.boolean  "journeyman_position", :default => false, :null => false
      t.text     "normal_skills"
      t.text     "double_skills"
      t.integer  "roster_id"
      t.integer  "maximum"
      t.text     "default_skills"
      t.datetime "created_at",                             :null => false
      t.datetime "updated_at",                             :null => false
    end

    create_table "rosters", :force => true do |t|
      t.string   "name"
      t.integer  "reroll_cost"
      t.datetime "created_at",                    :null => false
      t.datetime "updated_at",                    :null => false
      t.string   "logo_path"
      t.boolean  "allow_apo",   :default => true, :null => false
    end

    create_table "teams", :force => true do |t|
      t.string   "name"
      t.integer  "rerolls"
      t.integer  "assistant_coaches"
      t.integer  "cheerleaders"
      t.integer  "roster_id"
      t.datetime "created_at",                           :null => false
      t.datetime "updated_at",                           :null => false
      t.boolean  "apo",               :default => false, :null => false
      t.integer  "tv"
      t.integer  "fanfactor"
      t.integer  "gold"
    end

  end
end
