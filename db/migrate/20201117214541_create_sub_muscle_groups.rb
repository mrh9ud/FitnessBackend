class CreateSubMuscleGroups < ActiveRecord::Migration[6.0]
  def change
    create_table :sub_muscle_groups do |t|
      t.string :name
      t.references :muscle_group, null: false, foreign_key: true

      t.timestamps
    end
  end
end
