Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do

      resources :users do 
        member do
          get :confirm_email
        end
      end
      
      resources :users, only: :create
        post '/login', to: 'auth#create'
        get '/profile', to: 'users#profile'
    end
  end


end