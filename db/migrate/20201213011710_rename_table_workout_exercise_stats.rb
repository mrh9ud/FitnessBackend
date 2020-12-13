class RenameTableWorkoutExerciseStats < ActiveRecord::Migration[6.0]
  def change
    rename_table :workout_exercise_stats, :exercise_stats
  end
end
