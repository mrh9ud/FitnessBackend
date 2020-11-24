class ExerciseMuscleGroup < ApplicationRecord
  belongs_to :exercise
  belongs_to :muscle_group
end
