class CreateRepSets < ActiveRecord::Migration[6.0]
  def change
    create_table :rep_sets do |t|
      t.integer :reps
      t.references :exercise_rep_stats, foreign_key: true
    end
  end
end
