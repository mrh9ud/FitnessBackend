class PreventingNullDbValues < ActiveRecord::Migration[6.0]
  def change
    change_column_null :exercise_muscle_groups, :muscle_group_id, false
    change_column_null :exercise_muscle_groups, :primary, false
    change_column_null :exercise_sub_muscle_groups, :primary, false
    change_column_null :exercises, :weighted, false
    change_column_null :exercises, :setted, false
    change_column_null :exercises, :timed, false
    change_column_null :user_workouts, :completed, false
    change_column_null :users, :email_confirmed, false
    change_column_null :users, :resetting_password, false
    change_column_null :workouts, :flexibility, false
    change_column_null :workouts, :strength, false
    change_column_null :workouts, :cardio, false
  end
end
