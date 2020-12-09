class Exercise < ApplicationRecord
  has_many :workout_exercises
  has_many :workouts, through: :workout_exercises
  has_many :exercise_muscle_groups
  has_many :muscle_groups, through: :exercise_muscle_groups
  has_many :exercise_muscles
  has_many :muscles, through: :exercise_muscles
  has_many :exercise_sub_muscle_groups
  has_many :sub_muscle_groups, through: :exercise_sub_muscle_groups

  validates :name, uniqueness: { case_sensitive: false, message: "The exercise %{value} already exists", on: [:create, :update] }
  validates :name, presence: { message: "Exercise name must be provided" }, on: [:create, :update]
  validates :name, length: { in: 4..50, message: "Exercise name must be between 4 and 12 characters" }
  validates :difficulty, presence: { message: "An exercise must have a difficulty level" }, on: [:create, :update]
  validates :difficulty, inclusion: { in: %w(beginner intermediate advanced), message: "%{value} is not a valid difficulty.", on: [:create, :update] }
  # validates :duration, presence: { message: "An exercise must have an approximate duration." }, on: [:create, :udpate]
  # validates :duration, numericality: { only_integer: true, message: "An exercise duration must be a whole number of minutes" }
  validates :instructions, presence: { message: "An exercise must include general instructions." }, on: [:create, :update]
  validates :focus, inclusion: { in: %w(cardio strength flexibility str_cardio str_flex), message: "%{value} is not a valid exercise focus. Must be cardio, strength, flexibility, or a combination.", on: [:create, :update] }
  validates :focus, presence: { message: "An exercise must include a focus of strength, cardio, flexibility, or a combination." }

  def self.exercises_by_focus(exercises, focus)
    if !focus.empty? 
      if focus.length == 1
        exercises.where(focus: focus[0])
      elsif focus.length == 2
        if focus.includes('strength') && focus.includes('cardio')
          exercises.where(focus: 'str_cardio')
        elsif focus.includes('strength') && focus.includes('flexibility')
          exercises.where(focus: 'str_flex')
        else
          exercises.where(focus: 'cardio_flex')
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
      result = exercises.includes(:exercise_muscle_groups).where(exercise_muscle_groups: { muscle_group_id: muscle_groups[0][:id]})
      muscle_groups.each do |muscle_group|
        result = result.or(exercises.includes(:exercise_muscle_groups).where(exercise_muscle_groups: { muscle_group_id: muscle_group[:id] }))
      end
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
    Exercise.where(focus: 'strength')
  end

  def self.str_cardio_exercises
    Exercise.where(focus: 'str_cardio')
  end

  def self.cardio_exercises
    Exercise.where(focus: 'cardio')
  end

  def self.flexibility_exercises
    Exercise.where(focus: 'flexibility')
  end

  def self.str_flex_exercises
    Exercise.where(focus: 'str_flex')
  end
end