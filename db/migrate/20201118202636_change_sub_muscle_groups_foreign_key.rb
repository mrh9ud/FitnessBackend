class ChangeSubMuscleGroupsForeignKey < ActiveRecord::Migration[6.0]
  def change
    add_reference :sub_muscle_groups, :muscle, index: true, foreign_key: true
    remove_column :sub_muscle_groups, :muscle_group_id
  end
end
