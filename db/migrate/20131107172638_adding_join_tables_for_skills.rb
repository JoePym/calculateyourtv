class AddingJoinTablesForSkills < ActiveRecord::Migration
  def change
    create_table :players_skills do |t|
      t.integer :player_id
      t.integer :skill_id
    end

    add_index :players_skills, :player_id
    add_index :players_skills, :skill_id

  end
end
