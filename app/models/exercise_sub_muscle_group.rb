class ExerciseSubMuscleGroup < ApplicationRecord
    belongs_to :exercise
    belongs_to :sub_muscle_group


    def self.get_exercise_sub_muscle_group_ids(exercises_arr)
        exercise_sub_muscle_groups = []
        primary_muscle_groups_hash = {}
        secondary_muscle_groups_hash = {}

        exercises_arr.each do |exercise|
            exercise_sub_muscle_groups << exercise.exercise_sub_muscle_groups
        end
        exercise_sub_muscle_groups
    end

    # @return [Hash] key of exercise_ids and a value of an array of primary sub_muscle_group_ids
    def self.get_exercise_primary_sub_muscle_groups(exercise_sub_muscle_groups)
        primary_sub_muscle_groups_hash = {}

        exercise_sub_muscle_groups.each do |exercise_sub_muscle_group|
            primary_sub_muscle_groups_hash[exercise_sub_muscle_group.pluck(:exercise_id).first] = exercise_sub_muscle_group.where(primary: true).pluck(:sub_muscle_group_id)
        end
        primary_sub_muscle_groups_hash
    end

    # @return [Hash] key of exercise_ids and a value of an array of secondary sub_muscle_group_ids
    def self.get_exercise_secondary_sub_muscle_groups(exercise_sub_muscle_groups)
        secondary_sub_muscle_groups_hash = {}

        exercise_sub_muscle_groups.each do |exercise_sub_muscle_group|
            secondary_sub_muscle_groups_hash[exercise_sub_muscle_group.pluck(:exercise_id).first] = exercise_sub_muscle_group.where(primary: false).pluck(:sub_muscle_group_id)
        end
        secondary_sub_muscle_groups_hash
    end
end