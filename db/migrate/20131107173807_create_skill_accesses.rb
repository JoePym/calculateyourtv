class CreateSkillAccesses < ActiveRecord::Migration
  def change
    create_table :skill_accesses do |t|
      t.integer :skill_category_id
      t.integer :position_id
      t.boolean :normal, :default => false, :null => false
      t.timestamps
    end
  end
end
