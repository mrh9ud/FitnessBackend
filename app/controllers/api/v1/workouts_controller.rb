class Api::V1::WorkoutsController < ApplicationController
  
  def create
    sanitized_params = workout_params.tap { |key| key.delete(:muscle_groups) }
    create_workout(sanitized_params)
  end

  def update
    workout = Workout.find(workout_params[:id])
    if workout && workout.update(name: workout_params[:name])
      render json: workout.to_json( except: [:updated_at, :created_at])
    else
      render json: { error: true, message: "Unable to update workout name or find workout" }
    end
  end
  
  def generate_potential_workout
    focus_output = Workout.exercises_by_focus(workout_params)
    target_output = Workout.exercises_filtered_by_muscle_group(focus_output, workout_params[:muscle_groups])
    workout_hash = Workout.exercises_filtered_by_difficulty(target_output, params[:workout][:difficulty])
    if workout_hash
      render json: workout_hash.as_json(except: [:created_at, :updated_at])
    else
      render json: { error: true, message: "Server error in generating workout" }
    end
  end
  
  def swap_workout_exercise
    workout = Workout.find(workout_params[:id])
    exercises_focus_filtered = Workout.exercises_by_focus(workout)
    filtered_potential_exercises = exercises_focus_filtered.where(difficulty: workout[:difficulty]) - Workout.find(params[:workout][:id]).exercises
    new_exercise = filtered_potential_exercises.sample()
    join_to_delete = WorkoutExercise.where(exercise_id: params[:workout][:exerciseId], workout_id: workout.id)
    WorkoutExercise.delete(join_to_delete[0].id)
    WorkoutExercise.create(workout_id: workout.id, exercise_id: new_exercise.id)
    render json: { 
      workout_id: workout.id,
      old_exercise_id: params[:workout][:exerciseId],  
      exercise: new_exercise
    }
  end

  def create_own_workout
    difficulty = Workout.determine_workout_difficulty(params[:exercises])
    focus = Workout.determine_workout_focus(params[:exercises])
    workout_hash = {
      name: params[:workout][:name],
      difficulty: difficulty,
      strength: focus[0],
      cardio: focus[1],
      flexibility: focus[2]
    }
    create_workout(workout_hash)
  end

  def destroy
    if Workout.destroy(params[:id])
      render json: { id: params[:id] }
    else
      render json: { error: true, message: "Unable to delete workout" }
    end
  end

  private

  def create_workout(workout_hash)
    workout = Workout.create(workout_hash)
    exercises = params[:exercises]
    if workout
      user_workout = UserWorkout.create(user_id: params[:user][:id], workout_id: workout.id)
      exercises.map do |exercise|
        WorkoutExercise.create(exercise_id: exercise[:id], workout_id: workout.id)
      end
      workout_display = Workout.workout_info_to_display(workout.id, workout_hash, user_workout)
      render json: workout_display
    else
      render json: { error: true, message: "Server Error: Couldn't Create Workout" }
    end
  end

  def workout_params
    params.require(:workout).permit(:id, :name, :strength, :flexibility, :cardio, :difficulty, :muscle_groups => [])
  end
end