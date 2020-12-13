class AddingWeightStatsTable < ActiveRecord::Migration[6.0]
  def change
    create_table :weight_stats do |t|
      t.integer :sets
      t.integer :reps
      t.integer :weight
      t.references :exercise, null: false, foreign_key: true
      t.references :workout, null: false, foreign_key: true
    end
  end
end
