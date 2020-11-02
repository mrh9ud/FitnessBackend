class AddingColumnFlexibilityToWorkoutsTable < ActiveRecord::Migration[6.0]
  def change
    add_column :workouts, :flexibility, :boolean, default: false
  end
end
