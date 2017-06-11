PostitTemplate::Application.routes.draw do
  root to: 'posts#index'

  #manual route for register a new user
  get'/register', to: 'users#new'

  # manually creating routes for authentication
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy' # rails assumes you want logout_path

  resources :posts, except: [:destroy] do
    resources :comments, only: [:create]
  end

  resources :categories, only: [:new, :create, :show]
  resources :users, only: [:show, :create, :edit, :update]
end
