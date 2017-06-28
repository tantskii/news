Rails.application.routes.draw do
  root 'posts#index'

  devise_for :users

  resources :users, only: [:show, :edit, :update]

  resources :posts, only: [:index]

  resources :interests, only: [:destroy]
  resources :information_sources, only: [:destroy]
end
