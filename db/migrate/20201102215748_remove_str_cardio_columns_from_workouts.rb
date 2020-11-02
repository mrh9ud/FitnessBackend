class RemoveStrCardioColumnsFromWorkouts < ActiveRecord::Migration[6.0]
  def change
    remove_column :workouts, :strength
    remove_column :workouts, :cardio
    add_column :workouts, :focus, :string
  end
end
