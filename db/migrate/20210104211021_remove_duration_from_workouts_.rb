class RemoveDurationFromWorkouts < ActiveRecord::Migration[6.0]
  def change
    remove_column :workouts, :duration
    remove_column :exercises, :duration
    drop_table :exercise_stats
  end
end
