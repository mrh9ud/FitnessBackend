class CreateMuscles < ActiveRecord::Migration[6.0]
  def change
    create_table :muscles do |t|
      t.string :name
      t.references :sub_muscle_group, null: false, foreign_key: true

      t.timestamps
    end
  end
end
