class ChangeExerciseMusclesMuscleIdNotNull < ActiveRecord::Migration[6.0]
  def change
    change_column :exercise_muscles, :muscle_id, :bigint, :null => false
  end
end
