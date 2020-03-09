Rails.application.routes.draw do
  resources :portfolios
  resources :world_notes
  resources :images
  resources :worlds
  resources :world_notes
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
  post '/getworld', to: 'worlds#getworld'
  post '/getstory', to: 'stories#getstory'
  post '/getcharacter', to: 'characters#getcharacter'
  post '/getlocation', to: 'locations#getlocation'
  post '/getstory_note', to: 'story_notes#getstory_note'
  post '/getworld_note', to: 'world_notes#getworld_note'


  post '/getstories', to: 'stories#getstories'
  post '/getworldstories', to: 'stories#getworldstories'
  post '/getcharacters', to: 'characters#getcharacters'
  post '/getstorycharacters', to: 'story_characters#getstorycharacters'
  post '/getlocations', to: 'locations#getlocations'
  post '/getstorylocations', to: 'story_locations#getstorylocations'
  post '/getstory_notes', to: 'story_notes#getstory_notes'

  post '/worlds/new', to: 'worlds#create'
  post '/stories/new', to: 'stories#create'
  post '/characters/new', to: 'characters#create'
  post '/locations/new', to: 'locations#create'
  post '/story_notes/new', to: 'story_notes#create'









  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
