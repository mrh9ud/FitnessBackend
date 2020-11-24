class ExerciseSubMuscleGroup < ApplicationRecord
    belongs_to :exercise
    belongs_to :sub_muscle_group
end