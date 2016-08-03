Rails.application.routes.draw do

  resources :users
  resources :friendships
  resources :tasks

  resources :users do
    resources :tasks
  end

  root 'sessions#new'

  post '/add_friend' => 'friendships#add_friend'

  get '/login'  => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'

  get '/signup' => 'users#new'
  post '/users' => 'users#create'
  get '/search' => 'users#index'
  post '/search'=> 'users#index'


  post '/accept_friend'  => 'friendships#accept_friend'
  post '/decline_friend' => 'friendships#decline_friend'

  post '/users/:doer_id/request_task/:task_id' => "tasks#request_task", as: "request_task"
end
