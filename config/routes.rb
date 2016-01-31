Rails.application.routes.draw do

  root "users#index"
  get 'login' => 'sessions#new', as: 'login'
  post 'login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'
  get '/signup' => 'users#new'
  post '/users' => 'users#create'

  resources :users do
    resources :skills
    resources :skills do
      resources :requests
    end
  end
  resources :requests
  resources :skills
  resources :categories
end
