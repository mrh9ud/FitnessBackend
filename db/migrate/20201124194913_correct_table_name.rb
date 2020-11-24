class CorrectTableName < ActiveRecord::Migration[6.0]
  def change
    rename_table :table_exercise_muscle_groups, :exercise_muscle_groups
  end
end
