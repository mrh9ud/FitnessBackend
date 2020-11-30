class ChangeExerciseMuscleGroupsToExercisePrimaryMuscleGroups < ActiveRecord::Migration[6.0]
  def change
    remove_column :exercise_muscle_groups, :muscle_group_id
    add_reference :exercise_muscle_groups, :primary_muscle_group, index: true, foreign_key: true
    rename_table :exercise_muscle_groups, :exercise_primary_muscle_groups
  end
end
