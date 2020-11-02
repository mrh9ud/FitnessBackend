class Exercise < ApplicationRecord
    has_many :workout_exercises
    has_many :workouts, through: :workout_exercises

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
