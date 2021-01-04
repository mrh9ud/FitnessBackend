class CreateTableExerciseTimeStats < ActiveRecord::Migration[6.0]
  def change
    create_table :exercise_time_stats do |t|
      t.references :exercise, null: false, foreign_key: true
      t.references :workout, null: false, foreign_key: true
    end
  end
end
