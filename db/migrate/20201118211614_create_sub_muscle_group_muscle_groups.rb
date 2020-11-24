class CreateSubMuscleGroupMuscleGroups < ActiveRecord::Migration[6.0]
  def change
    create_table :sub_muscle_group_muscle_groups do |t|
      t.references :sub_muscle_group, null: false, foreign_key: true
      t.references :muscle_group, null: false, foreign_key: true
    end
  end
end
