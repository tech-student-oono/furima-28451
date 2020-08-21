Rails.application.routes.draw do
  devise_for :users
  get 'users/sign_up' <= 'devise/registrations#new'
  root to: 'items#index'
  resources :items
  resources :users, only: [:create, :edit, :update]
end