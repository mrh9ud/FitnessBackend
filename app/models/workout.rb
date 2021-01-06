class Workout < ApplicationRecord
  has_many :user_workouts
  has_many :users, through: :user_workouts, dependent: :destroy
  has_many :workout_exercises
  has_many :exercises, through: :workout_exercises, dependent: :destroy

  validates :name, presence: { message: "Workout name must be present."}, on: [:create, :update]
  validates :name, length: { in: 3..30, message: "Workout name must be between 3 and 30 characters." }

  def self.determine_workout_difficulty(exercises)
    difficulty_arr = [0, 0, 0]
    exercises.each do |exercise|
      case exercise[:difficulty]
      when 'beginner'
        difficulty_arr[0] += 2
      when 'intermediate'
        difficulty_arr[1] += 4
      when 'advanced'
        difficulty_arr[2] += 5
      end
    end

    if difficulty_arr[0] > difficulty_arr[1] && difficulty_arr[0] > difficulty_arr[2]
      'beginner'
    elsif difficulty_arr[1] >= difficulty_arr[0] && difficulty_arr[1] > difficulty_arr[2]
      'intermediate'
    elsif difficulty_arr[2] >= difficulty_arr[0] && difficulty_arr[2] >= difficulty_arr[1]
      'advanced'
    end
  end

  def self.determine_workout_focus(exercises)
    focus_arr_total = [0.0, 0.0, 0.0]
    threshold = 0.33
    exercises.each do |exercise|
      case exercise[:focus]
      when 'strength'
        focus_arr_total[0] += 1.0
      when 'cardio'
        focus_arr_total[1] += 1.0
      when 'flexibility'
        focus_arr_total[2] += 1.0
      when 'str_cardio'
        focus_arr_total[0] += 0.5
        focus_arr_total[1] += 0.5
      when 'str_flex'
        focus_arr_total[0] += 0.5
        focus_arr_total[2] += 0.5
      end
    end
    sum = focus_arr_total.reduce(0) { |sum, num| sum + num }
    focus_arr_total.map! { |focus| focus / sum }
    focus_arr = [false, false, false]
    focus_arr_total.each_with_index do |elem, index|
      focus_arr[index] = true if elem > threshold
    end
    focus_arr
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
      workout_hash[:duration] = workout.duration
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
