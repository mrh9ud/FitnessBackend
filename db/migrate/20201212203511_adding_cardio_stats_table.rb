class AddingCardioStatsTable < ActiveRecord::Migration[6.0]
  def change
    create_table :cardio_stats do |t|
      t.integer :sets
      t.time :integer
      t.references :exercise, null: false, foreign_key: true
      t.references :workout, null: false, foreign_key: true
    end
  end
end
