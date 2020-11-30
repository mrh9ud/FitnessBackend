class ChangeSecondaryMuscleGroups < ActiveRecord::Migration[6.0]
  def change
    rename_table :secondary_muscle_groups, :helper_muscle_groups
  end
end
