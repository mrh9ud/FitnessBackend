class DropHelperMuscleGrouips < ActiveRecord::Migration[6.0]
  def change
    drop_table :exercise_helper_muscle_groups
    drop_table :helper_muscle_groups
    remove_column :exercise_primary_muscle_groups, :primary_muscle_group_id
    rename_table :exercise_primary_muscle_groups, :exercise_muscle_groups
    rename_table :primary_muscle_groups, :muscle_groups
    add_reference :exercise_muscle_groups, :muscle_group, index: true, foreign_key: true
    add_column :exercise_muscle_groups, :primary, :boolean, default: false
  end
end
