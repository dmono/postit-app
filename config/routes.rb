PostitTemplate::Application.routes.draw do
  root to: 'posts#index'

  #manual route for register a new user
  get'/register', to: 'users#new'

  # manually creating routes for authentication
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy' # rails assumes you want logout_path

  resources :posts, except: [:destroy] do
    # use custom route to map this URL /posts/2/vote to PostController vote action
    # use member to create a route that pertains to an individual member's resource
    member do
      post 'vote'
    end

    resources :comments, only: [:create] do
      member do
        post 'vote' # /posts/post_id/comments/comment_id/vote
      end
    end
  end

  resources :categories, only: [:new, :create, :show]
  resources :users, only: [:show, :create, :edit, :update]
end
