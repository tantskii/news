Rails.application.routes.draw do
  devise_for :users
  resources :users, only: [:show, :edit, :update]

  resources :posts, only: [:index]
end
