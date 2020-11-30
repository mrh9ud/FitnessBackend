class ChangeMuscleGroupsToPrimaryMuscleGroups < ActiveRecord::Migration[6.0]
  def change
    rename_table :muscle_groups, :primary_muscle_groups
  end
end
