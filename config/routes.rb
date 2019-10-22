Rails.application.routes.draw do
  resources :images
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
  post '/getstories', to: 'stories#getstories'
  post '/getworldstories', to: 'stories#getworldstories'
  post '/getcharacters', to: 'characters#getcharacters'
  post '/getstorycharacters', to: 'characters#getstorycharacters'
  post '/getlocations', to: 'locations#getlocations'
  post '/getstorylocations', to: 'locations#getstorylocations'
  post '/getstory_notes', to: 'story_notes#getstory_notes'

  post '/worlds/new', to: 'worlds#create'
  post '/stories/new', to: 'stories#create'
  post '/characters/new', to: 'characters#create'
  post '/locations/new', to: 'locations#create'
  post '/story_notes/new', to: 'story_notes#create'









  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
