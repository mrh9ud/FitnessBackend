class Api::V1::WorkoutsController < ApplicationController
  def create
    workout = Workout.create(workout_params)
    exercises = params[:exercises]
    if workout
      user_workout = UserWorkout.create(user_id: params[:user][:id], workout_id: workout.id)
      exercises.map do |exercise|
        WorkoutExercise.create(exercise_id: exercise[:id], workout_id: workout.id)
      end
      workout_display = Workout.workout_info_to_display(workout.id, workout_params, user_workout)
      render json: workout_display
    else
      render json: { error: true, message: "Server Error: Couldn't Create Workout" }
    end
  end

  def update
    workout = Workout.find(workout_params[:id])
    if workout && workout.update(name: workout_params[:name])
      render json: workout.to_json( except: [:updated_at, :created_at])
    else
      render json: { error: true, message: "Unable to update workout name or find workout" }
    end
  end

  def generate_potential_workout
    focus_output = Workout.exercises_by_focus(workout_params)
    workout_hash = Workout.exercises_filtered_by_difficulty(focus_output, params[:workout][:difficulty])
    if workout_hash
      render json: workout_hash.as_json(except: [:created_at, :updated_at])
    else
      render json: { error: true, message: "Server error in generating workout" }
    end
  end

  private

  def workout_params
    params.require(:workout).permit(:id, :name, :strength, :flexibility, :cardio, :duration, :difficulty)
  end
end