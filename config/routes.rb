Rails.application.routes.draw do
  resources :exercises
  namespace :api do
    namespace :v1 do
      resources :workouts, only: [:create, :update]
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