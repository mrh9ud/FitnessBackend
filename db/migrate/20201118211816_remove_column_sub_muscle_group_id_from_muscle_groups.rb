class RemoveColumnSubMuscleGroupIdFromMuscleGroups < ActiveRecord::Migration[6.0]
  def change
    remove_column :muscle_groups, :sub_muscle_group_id
  end
end
