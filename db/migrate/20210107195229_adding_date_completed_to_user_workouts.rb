class AddingDateCompletedToUserWorkouts < ActiveRecord::Migration[6.0]
  def change
    add_column :user_workouts, :date_completed, :datetime
  end
end
