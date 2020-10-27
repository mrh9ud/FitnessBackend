class CreateExercises < ActiveRecord::Migration[6.0]
  def change
    create_table :exercises do |t|
      t.string :name
      t.string :difficulty
      t.integer :duration
      t.string :instructions
      t.string :type
      t.string :video_url

      t.timestamps
    end
  end
end
