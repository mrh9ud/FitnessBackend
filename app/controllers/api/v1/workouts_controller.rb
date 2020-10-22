class Api::V1::WorkoutsController < ApplicationController
    def create
        byebug
    end

    private

    def workout_params
        params.require(:workout).permit(:strength, :cardio, :duration, :difficulty)
    end
    
end
