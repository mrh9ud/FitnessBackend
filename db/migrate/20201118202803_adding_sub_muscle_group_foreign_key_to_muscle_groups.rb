class AddingSubMuscleGroupForeignKeyToMuscleGroups < ActiveRecord::Migration[6.0]
  def change
    add_reference :muscle_groups, :sub_muscle_group, index: true, foreign_key: true
  end
end
