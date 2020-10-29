class ChangeColumnNameExercisesType < ActiveRecord::Migration[6.0]
  def change
    rename_column :exercises, :type, :focus
  end
end
