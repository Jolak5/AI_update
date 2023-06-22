Rails.application.routes.draw do
  devise_for :users

  root to:  "users#index"

  resources :users, only: [:index, :show] do
    resources :posts, only: [:index, :new, :show] do
      resources :comments, only: [:new, :create]
      resources :likes, only: [:create, :destroy]
  end
end
  post 'users/:user_id/posts', to: 'posts#create', as: :user_create_post
end
