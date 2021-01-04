class CreateWeightSets < ActiveRecord::Migration[6.0]
  def change
    create_table :weight_sets do |t|
      t.integer :reps
      t.integer :weight
      t.references :exercise_weight_stat, null: false, foreign_key: true
    end
  end
end
