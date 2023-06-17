Rails.application.routes.draw do

  root to:  "users#index"

  resources :users, only: [:index, :show] do
    resources :posts, only: [:index, :show] do
      resources :comments, only: [:new, :create]
      resources :likes, only: [:create]
  end
end
  post 'users/:user_id/posts', to: 'posts#create', as: :user_create_post
end
