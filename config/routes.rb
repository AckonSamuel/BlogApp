Rails.application.routes.draw do
  devise_for :users
  resources :users, only: %i[index show] do
    resources :posts, only: %i[index show create new] do
      resources :comments, only: %i[create new]
      resources :likes, only: [:create]
    end
  end
  root to: 'users#index'
end