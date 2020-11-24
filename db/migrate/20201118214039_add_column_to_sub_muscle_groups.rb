class AddColumnToSubMuscleGroups < ActiveRecord::Migration[6.0]
  def change
    add_reference :sub_muscle_groups, :muscle_group, index: true, foreign_key: true
  end
end
