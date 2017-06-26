Rails.application.routes.draw do
  resources :users, only: [:show, :edit, :update]
end
