class AddingStarToPosition < ActiveRecord::Migration
  def change
    add_column :positions, :is_star_player, :boolean, default: false, null: false
  end
end
