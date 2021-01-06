class RemoveColumnFromExerciseRepeated < ActiveRecord::Migration[6.0]
  def change
    remove_column :exercises, :repeated
  end
end
