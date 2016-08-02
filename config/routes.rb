Rails.application.routes.draw do

  get 'mission_doer/create'

  get 'mission_doer/index'

  get 'mission_doer/destroy'

  get 'tasks/create'

  get 'tasks/index'

  get 'tasks/destroy'

  resources :users
  resources :friendships


  root 'sessions#new'

  post '/add_friend' => 'friendships#add_friend'

  # get 'friendships/create' => 'friendships#create'
  # get 'friendships' => 'friendships#index'
  # delete 'friendships/destroy' => 'friendships#destroy'

  get '/login'  => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'

  get '/signup' => 'users#new'
  post '/users' => 'users#create'
  get '/search' => 'users#index'
  post '/search'=> 'users#index'


  post '/accept_friend'  => 'friendships#accept_friend'
  post '/decline_friend' => 'friendships#decline_friend'
end
