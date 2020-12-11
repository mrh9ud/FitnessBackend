class ExerciseMuscleGroup < ApplicationRecord
  belongs_to :exercise
  belongs_to :muscle_group

  def self.get_exercise_muscle_group_ids(exercises_arr)
    exercise_muscle_groups = []

    exercises_arr.each do |exercise|
      exercise_muscle_groups << exercise.exercise_muscle_groups
    end

    exercise_muscle_groups
  end

  # @return [Hash] key of exercise_ids and a value of an array of primary muscle_group_ids
  def self.get_exercise_primary_muscle_groups(exercise_muscle_groups)
    primary_muscle_groups_hash = {}

    exercise_muscle_groups.each do |exercise_muscle_group|
      primary_muscle_groups_hash[exercise_muscle_group.pluck(:exercise_id).first] = exercise_muscle_group.where(primary: true).pluck(:muscle_group_id)
    end
    primary_muscle_groups_hash
  end

  # @return [Hash] key of exercise_ids and a value of an array of secondary muscle_group_ids
  def self.get_exercise_secondary_muscle_groups(exercise_muscle_groups)
    secondary_muscle_groups_hash = {}

    exercise_muscle_groups.each do |exercise_muscle_group|
      secondary_muscle_groups_hash[exercise_muscle_group.pluck(:exercise_id).first] = exercise_muscle_group.where(primary: false).pluck(:muscle_group_id)
    end
    secondary_muscle_groups_hash
  end
end
