class ChangeDefaultWorkoutsStrCardio < ActiveRecord::Migration[6.0]
  def change
    change_column :workouts, :strength, :boolean, default: false
    change_column :workouts, :cardio, :boolean, default: false
  end
end
