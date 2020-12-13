class AddWorkExerStatsTable < ActiveRecord::Migration[6.0]
  def change
    create_table :workout_exercise_stats do |t|
      t.integer :time
      t.integer :reps
      t.integer :sets
      t.integer :weight
      t.references :exercise, null: false, foreign_key: true
      t.references :workout, null: false, foreign_key: true
    end
  end
end
