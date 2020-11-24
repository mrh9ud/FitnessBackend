class DropSubMuscleGroupMuscleGroupsTable < ActiveRecord::Migration[6.0]
  def change
    drop_table :sub_muscle_group_muscle_groups
  end
end
