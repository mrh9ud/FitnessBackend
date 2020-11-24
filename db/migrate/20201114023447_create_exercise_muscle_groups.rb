class CreateExerciseMuscleGroups < ActiveRecord::Migration[6.0]
  def change
    create_table :exercise_muscle_groups do |t|
      t.references :exercise, null: false, foreign_key: true
      t.references :muscle_group, null: false, foreign_key: true

      t.timestamps
    end
  end
end
