Rails.application.routes.draw do

  resources :users


  root 'sessions#new'

  post '/add_friend' => 'friendships#add_friend'

  get 'friendships/create' => 'friendships#create'
  get 'friendships' => 'friendships#index'
  get 'friendships/destroy' => 'friendships#destroy'

  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'

  get '/signup' => 'users#new'
  post '/users' => 'users#create'

  post '/accept_friend' => 'friendships#accept_friend'
  post '/decline_friend' => 'friendships#decline_friend'
end
