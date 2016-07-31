Rails.application.routes.draw do

  get 'friendships/create'

  get 'friendships/index'

  get 'friendships/destroy'

  root 'users#show'

  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'

  resources :users

  get '/signup' => 'users#new'
  post '/users' => 'users#create'

end
