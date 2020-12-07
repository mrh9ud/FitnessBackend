Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do

      resources :exercises, only: :index
        get '/muscle_related_info', to: 'exercises#muscles_groups_sub_groups_muscles'
        post '/exercise_query', to: 'exercises#find_queried_exercises'

      resources :workouts, only: [:create, :update, :destroy]
        post '/swap_workout_exercise', to: 'workouts#swap_workout_exercise'
        post '/generate_potential_workout', to: 'workouts#generate_potential_workout'

      resources :users do
        member do
          get :confirm_email
        end
      end

      resources :users, only: [:create, :update]
        post '/login', to: 'auth#create'
        get '/profile', to: 'users#profile'
        post '/verify_email_username', to: 'auth#verify_email_username'
        post '/reset_password', to: 'users#reset_password'
        patch '/change_password', to: 'users#change_password'
    end
  end
end