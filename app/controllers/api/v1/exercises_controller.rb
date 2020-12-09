class Api::V1::ExercisesController < ApplicationController
  def find_queried_exercises
    filtered_by_name = exercise_params[:search_query].empty? ? Exercise.all : Exercise.exercises_by_name(exercise_params[:search_query])
    filtered_by_focus = exercise_params[:focus].empty? ? filtered_by_name : Exercise.exercises_by_focus(filtered_by_name, exercise_params[:focus])
    filtered_by_difficulty = exercise_params[:difficulty] == 'all' ? filtered_by_focus : filtered_by_focus.where(difficulty: exercise_params[:difficulty])
    filtered_by_muscle_groups = filtered_by_difficulty.exercises_by_muscle_groups(filtered_by_difficulty, exercise_params[:muscle_groups])
    exercise_id_primary_muscles = filtered_by_muscle_groups.includes(:exercise_muscle_groups, :muscle_groups)
                                                           .pluck("exercise_muscle_groups.exercise_id", "muscle_groups.name")
    filtered_exercises_hash = {}
    fully_filtered_exercises = []
    exercise_id_primary_muscles.each do |exercise_id_primary_muscle|
      if filtered_exercises_hash.key?(exercise_id_primary_muscle[0])
        filtered_exercises_hash[exercise_id_primary_muscle[0]] = filtered_exercises_hash[exercise_id_primary_muscle[0]] << exercise_id_primary_muscle[1]
      else
        filtered_exercises_hash[exercise_id_primary_muscle[0]] = [exercise_id_primary_muscle[1]]
      end
    end
    filtered_exercises_hash.each do |key, value|
      exercise = Exercise.find(key).as_json
      exercise[:primary] = value
      fully_filtered_exercises << exercise
    end
    render json: { exercises: fully_filtered_exercises }
  end

  private

  def exercise_params
    params.require(:exercise).permit(:difficulty, :search_query, :focus => [], :muscle_groups => [:id, :name], )
  end
end