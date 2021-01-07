class ExerciseRepStat < ApplicationRecord
  belongs_to :exercise
  belongs_to :workout
  has_many :rep_sets
end