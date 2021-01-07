class Exercise < ApplicationRecord
  has_many :workout_exercises
  has_many :workouts, through: :workout_exercises
  has_many :exercise_muscle_groups
  has_many :muscle_groups, through: :exercise_muscle_groups
  has_many :exercise_muscles
  has_many :muscles, through: :exercise_muscles
  has_many :exercise_sub_muscle_groups
  has_many :sub_muscle_groups, through: :exercise_sub_muscle_groups
  has_many :exercise_weight_stats
  has_many :exercise_time_stats
  has_many :weight_sets, through: :exercise_weight_stats
  has_many :time_sets, through: :exercise_time_stats
  has_many :exercise_rep_stats
  has_many :rep_sets, through: :exercise_rep_stats

  validates :name, uniqueness: { case_sensitive: false, message: "The exercise %{value} already exists", on: [:create, :update] }
  validates :name, presence: { message: "Exercise name must be provided" }, on: [:create, :update]
  validates :name, length: { in: 4..50, message: "Exercise name must be between 4 and 12 characters" }
  validates :difficulty, presence: { message: "An exercise must have a difficulty level" }, on: [:create, :update]
  validates :difficulty, inclusion: { in: %w(beginner intermediate advanced), message: "%{value} is not a valid difficulty.", on: [:create, :update] }
  validates :instructions, presence: { message: "An exercise must include general instructions." }, on: [:create, :update]
  validates :focus, inclusion: { in: %w(cardio strength flexibility str_cardio str_flex), message: "%{value} is not a valid exercise focus. Must be cardio, strength, flexibility, or a combination.", on: [:create, :update] }
  validates :focus, presence: { message: "An exercise must include a focus of strength, cardio, flexibility, or a combination." }

  def self.exercises_by_focus(exercises, focus)
    if !focus.empty? 
      if focus.length == 1
        exercises.where(focus: focus[0])
      elsif focus.length == 2
        if focus.include?(Exercise.strength) && focus.include?(Exercise.cardio)
          exercises.where(focus: Exercise.str_cardio)
        elsif focus.include?(Exercise.strength) && focus.include?(Exercise.flexibility)
          exercises.where(focus: Exercise.str_flex)
        else
          exercises.where(focus: Exercise.cardio_flex)
        end
      else focus.length == 3
        exercises
      end
    else
      exercises
    end
  end

  def self.exercises_by_muscle_groups(exercises, muscle_groups)
    if !muscle_groups.empty?
      target_exercises = exercises.includes(:exercise_muscle_groups).where(exercise_muscle_groups: { muscle_group_id: muscle_groups[0][:id]})
      muscle_groups.each do |muscle_group|
        target_exercises = target_exercises.or(exercises.includes(:exercise_muscle_groups).where(exercise_muscle_groups: { muscle_group_id: muscle_group[:id] }))
      end
      ids = target_exercises.includes(:exercise_muscle_groups).pluck(:exercise_id).uniq
      result = exercises.includes(:exercise_muscle_groups).where('exercise_muscle_groups.exercise_id' => ids)
      result
    else
      exercises
    end
  end

  def self.exercises_by_name(search_term)
    if !search_term.empty?
      Exercise.where("LOWER(exercises.name) like LOWER(?)", "%#{search_term}%")
    else
      Exercise.all
    end
  end

  def self.str_exercises
    Exercise.where(focus: Exercise.strength)
  end

  def self.str_cardio_exercises
    Exercise.where(focus: Exercise.str_cardio)
  end

  def self.cardio_exercises
    Exercise.where(focus: Exercise.cardio)
  end

  def self.flexibility_exercises
    Exercise.where(focus: Exercise.flexibility)
  end

  def self.str_flex_exercises
    Exercise.where(focus: Exercise.str_flex)
  end

  def self.strength
    'strength'
  end

  def self.cardio
    'cardio'
  end

  def self.flexibility
    'flexibility'
  end

  def self.str_cardio
    'str_cardio'
  end

  def self.str_flex
    'str_flex'
  end

  def self.cardio_flex
    'cardio_flex'
  end

  def self.str_cardio_flex
    'str_cardio_flex'
  end
end