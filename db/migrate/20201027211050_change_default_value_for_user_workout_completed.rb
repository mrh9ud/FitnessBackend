class ChangeDefaultValueForUserWorkoutCompleted < ActiveRecord::Migration[6.0]
  def change
    change_column :user_workouts, :completed, :boolean, default: false
  end
end
