Rails.application.routes.draw do

  resources :users

  get '/login' => 'sessions#new', as: 'login'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'
 
  root "users#index"

end
