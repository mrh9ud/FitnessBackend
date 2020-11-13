class AddColumnNameToWorkouts < ActiveRecord::Migration[6.0]
  def change
    add_column :workouts, :name, :string
  end
end
