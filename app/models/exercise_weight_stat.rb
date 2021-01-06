class ExerciseWeightStat < ApplicationRecord
  belongs_to :workout
  belongs_to :exercise
  has_many :weight_sets
end