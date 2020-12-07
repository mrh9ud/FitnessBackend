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
    byebug
  end

end