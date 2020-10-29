class Api::V1::WorkoutsController < ApplicationController
    def create
        workout = Workout.create(workout_params)
        user_workout = UserWorkout.create({ "user_id" => params[:id], "workout_id" => workout[:id], "completed" => false})
        render json: workout.as_json(only: [:id, :strength, :cardio, :difficulty, :duration]), status: :accepted
    end

    private

    def workout_params
        params.require(:workout).permit(:strength, :cardio, :duration, :difficulty)
    end
    
end
