class ExerciseMuscle < ApplicationRecord
    belongs_to :exercise
    belongs_to :muscle
end