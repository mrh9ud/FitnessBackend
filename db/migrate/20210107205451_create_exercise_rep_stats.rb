class CreateExerciseRepStats < ActiveRecord::Migration[6.0]
  def change
    create_table :exercise_rep_stats do |t|
      t.references :exercises, foreign_key: true
      t.references :workouts, foreign_key: true
    end
  end
end
