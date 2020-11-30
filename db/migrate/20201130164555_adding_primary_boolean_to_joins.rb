class AddingPrimaryBooleanToJoins < ActiveRecord::Migration[6.0]
  def change
    add_column :exercise_muscles, :primary, :boolean, default: false
    add_column :exercise_sub_muscle_groups, :primary, :boolean, default: false
  end
end
