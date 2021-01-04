class CreateTimeSets < ActiveRecord::Migration[6.0]
  def change
    create_table :time_sets do |t|
      t.integer :reps
      t.integer :time
      t.references :exercise_time_stat, null: false, foreign_key: true
    end
  end
end
