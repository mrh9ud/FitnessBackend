class ChangeExerciseMuscleGroupsToExerciseMuscles < ActiveRecord::Migration[6.0]
  def change
    rename_table :exercise_muscle_groups, :exercise_muscles
  end
end
