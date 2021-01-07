class FixForeignKeyOnExerciseRepStats < ActiveRecord::Migration[6.0]
  def change
    remove_column :exercise_rep_stats, :exercises_id
    remove_column :exercise_rep_stats, :workouts_id
    add_reference :exercise_rep_stats, :exercise, index: true
    add_reference :exercise_rep_stats, :workout, index: true
  end
end
