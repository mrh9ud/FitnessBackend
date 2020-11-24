class CreateTableMuscleSubMuscleGroups < ActiveRecord::Migration[6.0]
  def change
    create_table :table_muscle_sub_muscle_groups do |t|
      t.references :muscle, null: false, foreign_key: true
      t.references :sub_muscle_group, null: false, foreign_key: true
    end
  end
end
