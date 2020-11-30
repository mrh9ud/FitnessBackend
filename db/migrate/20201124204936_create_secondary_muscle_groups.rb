class CreateSecondaryMuscleGroups < ActiveRecord::Migration[6.0]
  def change
    create_table :secondary_muscle_groups do |t|
      t.string :name
      t.timestamps
    end
  end
end
