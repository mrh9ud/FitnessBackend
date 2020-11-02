class RevertingColumnChangesWorkoutsTable < ActiveRecord::Migration[6.0]
  def change
    remove_column :workouts, :focus
    add_column :workouts, :strength, :boolean, default: false
    add_column :workouts, :cardio, :boolean, default: false
  end
end
