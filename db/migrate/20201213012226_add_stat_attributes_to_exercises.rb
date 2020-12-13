class AddStatAttributesToExercises < ActiveRecord::Migration[6.0]
  def change
    add_column :exercises, :weighted, :boolean, :default => false
    add_column :exercises, :setted, :boolean, :default => false
    add_column :exercises, :timed, :boolean, :default => false
    add_column :exercises, :repeated, :boolean, :default => false
  end
end
