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
    filtered_by_name = Exercise.exercises_by_name(params[:search_query])
    if filtered_by_name.empty?
      render json: { exercises: [] }
    else
      filtered_by_focus = Exercise.exercises_by_focus(filtered_by_name, params[:focus])
      if filtered_by_focus.empty?
        render json: { exercises: [] }
      else
        filtered_by_difficulty = filtered_by_focus.where(difficulty: params[:difficulty])
        if filtered_by_difficulty.empty?
          render json: { exercises: [] }
        else
          fully_filtered = filtered_by_difficulty.exercises_by_muscle_groups(filtered_by_difficulty, params[:muscle_groups])
        end
      end
    end

  end

end