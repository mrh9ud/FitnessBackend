class ChangeReferenceOnRepSets < ActiveRecord::Migration[6.0]
  def change
    rename_column :rep_sets, :exercise_rep_stats_id, :exercise_rep_stat_id
    change_column :rep_sets, :exercise_rep_stat_id, :bigint, null: false
  end
end
