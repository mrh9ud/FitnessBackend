class RenameTableMuscleSubMuscleGroups < ActiveRecord::Migration[6.0]
  def change
    rename_table :table_muscle_sub_muscle_groups, :muscle_sub_muscle_groups
  end
end
