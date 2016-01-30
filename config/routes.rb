Rails.application.routes.draw do

  resources :users
 
  root "users#index"

    get '/login' => 'sessions#new', as: 'login'
    post '/login' => 'sessions#create'
    get '/logout' => 'sessions#destroy'


end
