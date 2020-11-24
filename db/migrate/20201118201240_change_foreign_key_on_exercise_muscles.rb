class ChangeForeignKeyOnExerciseMuscles < ActiveRecord::Migration[6.0]
  def change
    remove_column :exercise_muscles, :muscle_group_id
    add_reference :exercise_muscles, :muscle, index: true, foreign_key: true
  end
end
