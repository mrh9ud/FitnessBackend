class MuscleGroup < ApplicationRecord
    has_many :exercise_muscle_groups
    has_many :exercises, through: :exercise_muscle_groups
end
