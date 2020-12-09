class Api::V1::ExercisesController < ApplicationController
  def muscles_groups_sub_groups_muscles
    render json: {
      muscle_groups: MuscleGroup.all.as_json(only: [:id, :name]),
      sub_muscle_groups: SubMuscleGroup.all.as_json(only: [:id, :name]),
      muscles: Muscle.all.as_json(only: [:id, :name])
    }
  end

  def index
    render json: { exercises: Exercise.all.as_json(only: [:id, :name, :focus]) }
  end

  def find_queried_exercises
    filtered_by_name = Exercise.exercises_by_name(exercise_params[:search_query])
    if filtered_by_name.empty?
      render json: { exercises: [] }
    else
      filtered_by_focus = Exercise.exercises_by_focus(filtered_by_name, exercise_params[:focus])
      if filtered_by_focus.empty?
        render json: { exercises: [] }
      else
        filtered_by_difficulty = filtered_by_focus.where(difficulty: exercise_params[:difficulty])
        if filtered_by_difficulty.empty?
          render json: { exercises: [] }
        else
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
      end
    end
  end

  private

  def exercise_params
    params.require(:exercise).permit(:difficulty, :search_query, :focus => [], :muscle_groups => [:id, :name], )
  end
end