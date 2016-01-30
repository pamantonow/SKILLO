Rails.application.routes.draw do

  resources :users do
    resources :skills
  end

	resources :categories	 

  root "users#index"

  get '/login' => 'sessions#new', as: 'login'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'




end
