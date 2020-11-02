class Api::V1::WorkoutsController < ApplicationController
    def create
        workout = Workout.create(workout_params)
        user_workout = UserWorkout.create({ user_id: params[:id], workout_id: workout[:id] })
        render json: workout.as_json(only: [:id, :strength, :cardio, :difficulty, :duration]), status: :accepted
    end

    def generate_potential_workout
        focus_output = Workout.exercises_by_focus(workout_params)
        difficulty_output = Workout.exercises_filtered_by_difficulty(focus_output, params[:workout][:difficulty])
        if difficulty_output
            render json: difficulty_output.as_json(except: [:created_at, :updated_at])
        else
            render json: { error: true, message: "Server error in generating workout" }
        end
    end

    private

    def workout_params
        params.require(:workout).permit(:strength, :flexibility, :cardio, :duration, :difficulty)
    end
    
end
