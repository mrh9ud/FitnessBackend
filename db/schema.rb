# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2021_01_07_222646) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "exercise_muscle_groups", force: :cascade do |t|
    t.bigint "exercise_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "muscle_group_id", null: false
    t.boolean "primary", default: false, null: false
    t.index ["exercise_id"], name: "index_exercise_muscle_groups_on_exercise_id"
    t.index ["muscle_group_id"], name: "index_exercise_muscle_groups_on_muscle_group_id"
  end

  create_table "exercise_muscles", force: :cascade do |t|
    t.bigint "exercise_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "muscle_id", null: false
    t.boolean "primary", default: false
    t.index ["exercise_id"], name: "index_exercise_muscles_on_exercise_id"
    t.index ["muscle_id"], name: "index_exercise_muscles_on_muscle_id"
  end

  create_table "exercise_rep_stats", force: :cascade do |t|
    t.bigint "exercise_id", null: false
    t.bigint "workout_id", null: false
    t.index ["exercise_id"], name: "index_exercise_rep_stats_on_exercise_id"
    t.index ["workout_id"], name: "index_exercise_rep_stats_on_workout_id"
  end

  create_table "exercise_sub_muscle_groups", force: :cascade do |t|
    t.bigint "exercise_id", null: false
    t.bigint "sub_muscle_group_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.boolean "primary", default: false, null: false
    t.index ["exercise_id"], name: "index_exercise_sub_muscle_groups_on_exercise_id"
    t.index ["sub_muscle_group_id"], name: "index_exercise_sub_muscle_groups_on_sub_muscle_group_id"
  end

  create_table "exercise_time_stats", force: :cascade do |t|
    t.bigint "exercise_id", null: false
    t.bigint "workout_id", null: false
    t.index ["exercise_id"], name: "index_exercise_time_stats_on_exercise_id"
    t.index ["workout_id"], name: "index_exercise_time_stats_on_workout_id"
  end

  create_table "exercise_weight_stats", force: :cascade do |t|
    t.bigint "exercise_id", null: false
    t.bigint "workout_id", null: false
    t.index ["exercise_id"], name: "index_exercise_weight_stats_on_exercise_id"
    t.index ["workout_id"], name: "index_exercise_weight_stats_on_workout_id"
  end

  create_table "exercises", force: :cascade do |t|
    t.string "name"
    t.string "difficulty"
    t.string "instructions"
    t.string "focus"
    t.string "video_url"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.boolean "weighted", default: false, null: false
    t.boolean "setted", default: false, null: false
    t.boolean "timed", default: false, null: false
  end

  create_table "muscle_groups", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "muscles", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "rep_sets", force: :cascade do |t|
    t.integer "reps"
    t.bigint "exercise_rep_stat_id", null: false
    t.index ["exercise_rep_stat_id"], name: "index_rep_sets_on_exercise_rep_stat_id"
  end

  create_table "sub_muscle_groups", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "time_sets", force: :cascade do |t|
    t.integer "reps"
    t.integer "time"
    t.bigint "exercise_time_stat_id", null: false
    t.index ["exercise_time_stat_id"], name: "index_time_sets_on_exercise_time_stat_id"
  end

  create_table "user_workouts", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "workout_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_user_workouts_on_user_id"
    t.index ["workout_id"], name: "index_user_workouts_on_workout_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "first_name"
    t.string "last_name"
    t.string "email"
    t.string "password_digest"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.boolean "email_confirmed", default: false, null: false
    t.string "confirm_token"
    t.datetime "reset_password_sent_at"
    t.boolean "resetting_password", default: false, null: false
  end

  create_table "weight_sets", force: :cascade do |t|
    t.integer "reps"
    t.integer "weight"
    t.bigint "exercise_weight_stat_id", null: false
    t.index ["exercise_weight_stat_id"], name: "index_weight_sets_on_exercise_weight_stat_id"
  end

  create_table "workout_exercises", force: :cascade do |t|
    t.bigint "exercise_id", null: false
    t.bigint "workout_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["exercise_id"], name: "index_workout_exercises_on_exercise_id"
    t.index ["workout_id"], name: "index_workout_exercises_on_workout_id"
  end

  create_table "workouts", force: :cascade do |t|
    t.string "difficulty"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.boolean "flexibility", default: false, null: false
    t.boolean "strength", default: false, null: false
    t.boolean "cardio", default: false, null: false
    t.string "name"
    t.boolean "completed", default: false, null: false
    t.datetime "date_completed"
  end

  add_foreign_key "exercise_muscle_groups", "exercises"
  add_foreign_key "exercise_muscle_groups", "muscle_groups"
  add_foreign_key "exercise_muscles", "exercises"
  add_foreign_key "exercise_muscles", "muscles"
  add_foreign_key "exercise_sub_muscle_groups", "exercises"
  add_foreign_key "exercise_sub_muscle_groups", "sub_muscle_groups"
  add_foreign_key "exercise_time_stats", "exercises"
  add_foreign_key "exercise_time_stats", "workouts"
  add_foreign_key "exercise_weight_stats", "exercises"
  add_foreign_key "exercise_weight_stats", "workouts"
  add_foreign_key "rep_sets", "exercise_rep_stats"
  add_foreign_key "time_sets", "exercise_time_stats"
  add_foreign_key "user_workouts", "users"
  add_foreign_key "user_workouts", "workouts"
  add_foreign_key "weight_sets", "exercise_weight_stats"
  add_foreign_key "workout_exercises", "exercises"
  add_foreign_key "workout_exercises", "workouts"
end
