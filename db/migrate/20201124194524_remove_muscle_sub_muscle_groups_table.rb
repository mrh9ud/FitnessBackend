class RemoveMuscleSubMuscleGroupsTable < ActiveRecord::Migration[6.0]
  def change
    drop_table :muscle_sub_muscle_groups
  end
end
