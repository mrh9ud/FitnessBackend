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
        workout_hash = {}
        potential_exercises = workouts.where(difficulty: difficulty)
        current_exercises = potential_exercises.sample(6)
        workout_hash[:current_exercises] = current_exercises
        workout_hash[:potential_exercises] = potential_exercises
        workout_hash[:already_cycled_exercises] = []
        workout_hash
    end
end
