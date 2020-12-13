class RemoveCardioWeightStatsTables < ActiveRecord::Migration[6.0]
  def change
    drop_table :weight_stats
    drop_table :cardio_stats
  end
end
