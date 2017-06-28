Rails.application.routes.draw do
  root 'posts#index'

  devise_for :users

  resources :users, only: [:show, :edit, :update]

  resources :posts, only: [:index]
end
