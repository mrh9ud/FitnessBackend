class Workout < ApplicationRecord
  has_many :user_workouts
  has_many :users, through: :user_workouts, dependent: :destroy
  has_many :workout_exercises
  has_many :exercises, through: :workout_exercises, dependent: :destroy
  has_many :exercise_weight_stats
  has_many :exercise_time_stats
  has_many :weight_sets, through: :exercise_weight_stats, dependent: :destroy
  has_many :time_sets, through: :exercise_time_stats, dependent: :destroy

  validates :name, presence: { message: "Workout name must be present."}, on: [:create, :update]
  validates :name, length: { in: 3..30, message: "Workout name must be between 3 and 30 characters." }

  def self.determine_workout_difficulty(exercises)
    difficulty_hash = { 'beginner': 0, 'intermediate': 0, 'advanced': 0 }
    exercises.each do |exercise|
      case exercise.difficulty
      when 'beginner'
        difficulty_hash[:beginner] += 1
      when 'intermediate'
        difficulty_hash[:intermediate] += 1
      when 'advanced'
        difficulty_hash[:advanced] += 1
      end
    end
    sum = difficulty_hash[:beginner] + difficulty_hash[:intermediate] + difficulty_hash[:advanced]
    if difficulty_hash[:beginner]/sum >= (2/3)
      'beginner'
    elsif difficulty_hash[:intermediate]/sum >= (2/3)
      'intermediate'
    elsif difficulty_hash[:advanced]/sum >= (2/3)
      'advanced'
    end
      
  end

  def self.exercises_by_focus(workout_params)
      if workout_params[:strength] && workout_params[:cardio]
          potential_exercises = Exercise.str_cardio_exercises
      elsif workout_params[:strength]
          potential_exercises = Exercise.str_exercises
      else workout_params[:cardio]
          potential_exercises = Exercise.cardio_exercises
      end
  end

  def self.exercises_filtered_by_difficulty(workouts, difficulty)
      workout_hash = {}
      potential_exercises = workouts.where(difficulty: difficulty)
      current_exercises = potential_exercises.sample(6)
      workout_hash[:current_exercises] = current_exercises
      workout_hash[:potential_exercises] = potential_exercises
      workout_hash[:already_cycled_exercises] = []
      workout_hash
  end

  def self.workout_info_to_display(id, workout_params, user_workout)
      workout_hash = {}
      workout_hash[:id] = id
      workout_hash.merge!(workout_params)
      workout_hash[:completed] = user_workout.completed
      workout_hash[:exercises] = self.find(id).exercises
      workout_hash
  end

  def self.find_workout_exercises(workouts_arr, id)
      result = workouts_arr.map do |workout|
          workout_hash = {}
          workout_hash[:id] = workout.id
          workout_hash[:name] = workout.name
          workout_hash[:difficulty] = workout.difficulty
          workout_hash[:strength] = workout.strength
          workout_hash[:cardio] = workout.cardio
          workout_hash[:flexibility] = workout.flexibility
          workout_hash[:completed] = workout.user_workouts.find_by(user_id: id).completed
          workout_hash[:exercises] = workout.exercises
          workout_hash
      end
      result
  end

  def self.exercises_filtered_by_muscle_group(exercises, muscle_groups)
      target_muscle_groups = muscle_groups.map do |muscle_group|
          MuscleGroup.find_by(name: muscle_group)
      end
      target_exercises = exercises.includes(:exercise_muscle_groups).where(exercise_muscle_groups: { muscle_group_id: target_muscle_groups[0].id, primary: true })
      target_muscle_groups.each do |target_muscle_group|
          target_exercises = target_exercises.or(exercises.includes(:exercise_muscle_groups).where(exercise_muscle_groups: { muscle_group_id: target_muscle_group.id, primary: true }))
      end
      potential_exercises = target_exercises
      potential_exercises
  end
end
