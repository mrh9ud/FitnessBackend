class ExerciseMuscle < ApplicationRecord
    belongs_to :exercise
    belongs_to :muscle

    def self.get_exercise_muscle_ids(exercises_arr)
        exercise_muscles = []

        exercises_arr.each do |exercise|
            exercise_muscles << exercise.exercise_muscles
        end
        exercise_muscles
    end


    # @return [Hash] key of exercise_ids and a value of an array of primary muscle_ids
    def self.get_exercise_primary_muscles(exercise_muscles)
        primary_muscles_hash = {}

        exercise_muscles.each do |exercise_muscle|
            primary_muscles_hash[exercise_muscle.pluck(:exercise_id).first] = exercise_muscle.where(primary: true).pluck(:muscle_id)
        end
        primary_muscles_hash
    end

    # @return [Hash] key of exercise_ids and a value of an array of secondary muscle_ids
    def self.get_exercise_secondary_muscles(exercise_muscles)
        secondary_muscles_hash = {}

        exercise_muscles.each do |exercise_muscle|
            secondary_muscles_hash[exercise_muscle.pluck(:exercise_id).first] = exercise_muscle.where(primary: false).pluck(:muscle_id)
        end
        secondary_muscles_hash
    end
end