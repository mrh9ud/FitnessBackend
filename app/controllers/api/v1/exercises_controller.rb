class Api::V1::ExercisesController < ApplicationController



    private

    def exercise_params
        params.require(:exercise).permit(:name, :difficulty, :duration, :instructions, :focus, :video_url)
    end
end
