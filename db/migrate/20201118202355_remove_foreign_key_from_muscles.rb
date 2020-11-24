class RemoveForeignKeyFromMuscles < ActiveRecord::Migration[6.0]
  def change
    remove_column :muscles, :sub_muscle_group_id
  end
end
