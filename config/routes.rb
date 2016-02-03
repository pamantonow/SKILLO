Rails.application.routes.draw do

  root "welcome#index"


  get 'login' => 'sessions#new', as: 'login'
  post 'login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'
  get '/signup' => 'users#new'
  post '/users' => 'users#create'
  get 'users/current' => 'users#current'

 

  resources :users do
    resources :skills
     resources :reviews
    resources :skills do
      resources :requests
    end
  end

  resources :requests do
    resources :messages
  end

  

  resources :skills
  resources :categories
  resources :collections
  resources :requests 
  resources :search


 

end
