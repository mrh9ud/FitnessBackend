class FixJoinTable < ActiveRecord::Migration[6.0]
  def change
    drop_table :exercise_weight_stats
    create_table :exercise_weight_stats do |t|
      t.references :exercise, null: false, foreign_key: true
      t.references :workout, null: false, foreign_key: true
    end
  end
end
