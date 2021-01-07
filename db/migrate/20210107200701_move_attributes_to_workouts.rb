class MoveAttributesToWorkouts < ActiveRecord::Migration[6.0]
  def change
    remove_column :user_workouts, :completed
    remove_column :user_workouts, :date_completed
    add_column :workouts, :completed, :boolean, default: false, null: false
    add_column :workouts, :date_completed, :datetime
  end
end
