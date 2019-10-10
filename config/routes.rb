Rails.application.routes.draw do
  resources :worlds
  resources :story_locations
  resources :story_characters
  resources :locations
  resources :characters
  resources :story_notes
  resources :stories
  resources :names
  resources :users, only: [:create]
  resources :auth

  post '/login', to: 'auth#login'
  post '/signup', to: 'users#create'
  post '/getworlds', to: 'worlds#getworlds'

    # get '/profile', to: 'user#profile'











  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
