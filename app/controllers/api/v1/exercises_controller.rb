class Api::V1::ExercisesController < ApplicationController
  def find_queried_exercises
    filtered_by_name = exercise_params[:search_query].empty? ? Exercise.all : Exercise.exercises_by_name(exercise_params[:search_query])
    filtered_by_focus = exercise_params[:focus].empty? ? filtered_by_name : Exercise.exercises_by_focus(filtered_by_name, exercise_params[:focus])
    filtered_by_difficulty = exercise_params[:difficulty] == 'all' ? filtered_by_focus : filtered_by_focus.where(difficulty: exercise_params[:difficulty])
    filtered_by_muscle_groups = filtered_by_difficulty.exercises_by_muscle_groups(filtered_by_difficulty, exercise_params[:muscle_groups])

    filtered_exercise_ids = filtered_by_muscle_groups.pluck(:id)
    filtered_exercises = Exercise.find(filtered_exercise_ids)
    exercise_muscle_groups = []
    exercise_sub_muscle_groups = []
    exercise_muscles = []

    filtered_exercises.each do |filtered_exercise|
      exercise_muscle_groups << filtered_exercise.exercise_muscle_groups
      exercise_sub_muscle_groups << filtered_exercise.exercise_sub_muscle_groups
      exercise_muscles << filtered_exercise.exercise_muscles
    end

    primary_muscle_groups_hash = {}
    secondary_muscle_groups_hash = {}
    primary_sub_muscle_groups_hash = {}
    secondary_sub_muscle_groups_hash = {}
    primary_muscles_hash = {}
    secondary_muscles_hash = {}
    exercise_muscle_groups.each do |exercise_muscle_group|
      primary_muscle_groups_hash[exercise_muscle_group.pluck(:exercise_id).first] = exercise_muscle_group.where(primary: true).pluck(:muscle_group_id)
      secondary_muscle_groups_hash[exercise_muscle_group.pluck(:exercise_id).first] = exercise_muscle_group.where(primary: false).pluck(:muscle_group_id)
    end

    exercise_sub_muscle_groups.each do |exercise_sub_muscle_group|
      primary_sub_muscle_groups_hash[exercise_sub_muscle_group.pluck(:exercise_id).first] = exercise_sub_muscle_group.where(primary: true).pluck(:sub_muscle_group_id)
      secondary_sub_muscle_groups_hash[exercise_sub_muscle_group.pluck(:exercise_id).first] = exercise_sub_muscle_group.where(primary: false).pluck(:sub_muscle_group_id)
    end

    exercise_muscles.each do |exercise_muscle|
      primary_muscles_hash[exercise_muscle.pluck(:exercise_id).first] = exercise_muscle.where(primary: true).pluck(:muscle_id)
      secondary_muscles_hash[exercise_muscle.pluck(:exercise_id).first] = exercise_muscle.where(primary: false).pluck(:muscle_id)
    end

    fully_filtered_exercises = []
    primary_muscle_groups_hash.each do |key, value|
      exercise = Exercise.find(key).as_json
      exercise[:primary_muscle_groups] = MuscleGroup.find(value).pluck(:name)
      exercise[:secondary_muscle_groups] = MuscleGroup.find(secondary_muscle_groups_hash[key]).pluck(:name)
      exercise[:primary_sub_muscle_groups] = SubMuscleGroup.find(primary_sub_muscle_groups_hash[key]).pluck(:name)
      exercise[:secondary_sub_muscle_groups] = SubMuscleGroup.find(secondary_sub_muscle_groups_hash[key]).pluck(:name)
      exercise[:primary_muscles] = Muscle.find(primary_muscles_hash[key]).pluck(:name)
      exercise[:secondary_muscles] = Muscle.find(secondary_muscles_hash[key]).pluck(:name)
      fully_filtered_exercises << exercise
    end
    render json: { exercises: fully_filtered_exercises }
  end

  private

  def exercise_params
    params.require(:exercise).permit(:difficulty, :search_query, :focus => [], :muscle_groups => [:id, :name], )
  end
end