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
        if exercise_params[:difficulty] == 'all'
          filtered_by_difficulty = filtered_by_focus
        else
          filtered_by_difficulty = filtered_by_focus.where(difficulty: exercise_params[:difficulty])
        end
        if filtered_by_difficulty.empty?
          render json: { exercises: [] }
        else
          fully_filtered_exercises = filtered_by_difficulty.exercises_by_muscle_groups(filtered_by_difficulty, exercise_params[:muscle_groups])
          primary_exercises = []
          fully_filtered_exercises.map do |exercise|
            primary_muscle_groups = exercise.exercise_muscle_groups.map do |exercise_muscle_group|
              if exercise_muscle_group.primary
                exercise_muscle_group.muscle_group.name
              end
            end
            primary_muscle_groups.reject! { |muscle_group| muscle_group.nil? }
            primary_exercises.push({ id: exercise.id, muscle_group_name: primary_muscle_groups })            
          end
          # byebug
          render json: { exercises: fully_filtered_exercises }
        end
      end
    end
  end

  private

  def exercise_params
    params.require(:exercise).permit(:id, :difficulty, :search_query, :focus => [], :muscle_groups => [:id, :name], )
  end
end