class ChangeIntegerOnCardioStats < ActiveRecord::Migration[6.0]
  def change
    remove_column :cardio_stats, :integer
    add_column :cardio_stats, :time, :integer
  end
end
