class ExerciseTimeStat < ApplicationRecord
  belongs_to :exercise
  belongs_to :workout
  has_many :time_sets
end