class SubMuscleGroup < ApplicationRecord
    has_many :exercise_sub_muscle_groups
    has_many :exercises, through: :exercise_sub_muscle_groups
end