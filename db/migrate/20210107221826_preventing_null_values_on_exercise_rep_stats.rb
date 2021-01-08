class PreventingNullValuesOnExerciseRepStats < ActiveRecord::Migration[6.0]
  def change
    change_column :exercise_rep_stats, :exercise_id, :bigint, null: false
    change_column :exercise_rep_stats, :workout_id, :bigint, null: false
  end
end
