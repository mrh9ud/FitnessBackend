Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do

      resources :exercises
        post '/exercise_query', to: 'exercises#find_queried_exercises'

      resources :workouts, only: [:create, :update, :destroy]
        post '/swap_workout_exercise', to: 'workouts#swap_workout_exercise'
        post '/generate_potential_workout', to: 'workouts#generate_potential_workout'
        post '/create_own_workout', to: 'workouts#create_own_workout'

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