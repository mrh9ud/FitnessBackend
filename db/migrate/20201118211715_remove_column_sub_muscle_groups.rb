class RemoveColumnSubMuscleGroups < ActiveRecord::Migration[6.0]
  def change
    remove_column :sub_muscle_groups, :muscle_id
  end
end