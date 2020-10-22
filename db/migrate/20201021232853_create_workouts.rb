class CreateWorkouts < ActiveRecord::Migration[6.0]
  def change
    create_table :workouts do |t|
      t.boolean :strength
      t.boolean :cardio
      t.string :difficulty
      t.integer :duration

      t.timestamps
    end
  end
end
