class RenamingMovement < ActiveRecord::Migration
  def change
    rename_column :positions, :mv, :ma
  end
end
