Rails.application.routes.draw do
  get 'conmments/create'
  get 'conmments/new'
  get 'conmments/comment_params'
    # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  
    # Defines the root path route ("/")
    # root "articles#index"
  
    resources :users, only: [:index, :show] do
      resources :posts, only: [:index, :show]
  end
  end
  