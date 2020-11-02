class Workout < ApplicationRecord
    has_many :user_workouts
    has_many :users, through: :user_workouts
    has_many :workout_exercises
    has_many :exercises, through: :workout_exercises

    def self.exercises_by_focus(workout_params)
        if workout_params[:strength] && workout_params[:cardio]
            potential_exercises = Exercise.str_cardio_exercises
        elsif workout_params[:strength]
            potential_exercises = Exercise.str_exercises
        else workout_params[:cardio]
            potential_exercises = Exercise.cardio_exercises
        end
    end

    def self.exercises_filtered_by_difficulty(workouts, difficulty)
        filtered_workouts = workouts.where(difficulty: difficulty)
        filtered_workouts[0,6]
    end
end
