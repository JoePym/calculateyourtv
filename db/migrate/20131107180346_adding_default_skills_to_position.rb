class AddingDefaultSkillsToPosition < ActiveRecord::Migration
  def change
    remove_column :positions, :normal_skills
    remove_column :positions, :double_skills
    remove_column :positions, :default_skills

    create_table :positions_skills do |t|
      t.integer :skill_id
      t.integer :position_id
    end
  end
end
