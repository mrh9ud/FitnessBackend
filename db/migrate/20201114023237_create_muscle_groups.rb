class CreateMuscleGroups < ActiveRecord::Migration[6.0]
  def change
    create_table :muscle_groups do |t|
      t.string :name

      t.timestamps
    end
  end
end
