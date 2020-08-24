Rails.application.routes.draw do
  devise_for :users
  get 'users/create'
  root to: 'items#index'
  resources :users
  resources :items
end