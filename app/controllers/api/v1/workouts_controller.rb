class Api::V1::WorkoutsController < ApplicationController
    def create
        workout = Workout.create(workout_params)
        exercises = params[:exercises]
        if workout
            user_workout = UserWorkout.create(user_id: params[:user][:id], workout_id: workout.id)
            exercises.map do |exercise|
                WorkoutExercise.create(exercise_id: exercise[:id], workout_id: workout.id)
            end
            render json: {
                workout: {
                    id: workout.id,
                    completed: false,
                    exercises: exercises
                }
            }
        else
            render json: { error: true, message: "Server Error: Couldn't Create Workout" }
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
        params.require(:workout).permit(:strength, :flexibility, :cardio, :duration, :difficulty)
    end
    
end