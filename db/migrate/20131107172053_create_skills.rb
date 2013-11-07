class CreateSkills < ActiveRecord::Migration
  def change
    create_table :skills do |t|
      t.string :name
      t.integer :skill_category_id
      t.timestamps
    end
    add_index :skills, :skill_category_id
  end
end
