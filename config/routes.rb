Rails.application.routes.draw do
  resources :users, only: [:show, :edit, :update]

  resources :posts, only: [:index]
end
