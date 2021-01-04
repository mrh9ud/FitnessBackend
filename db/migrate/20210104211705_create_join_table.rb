class CreateJoinTable < ActiveRecord::Migration[6.0]
  def change
    create_join_table :workouts, :exercises, table_name: :exercise_weight_stats
  end
end
