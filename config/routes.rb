Rails.application.routes.draw do
  get 'users/create'
  devise_for :users
  get 'users/sign_up' <= 'devise/registrations#new'
  root to: 'items#index'
  resources :furimas
  resources :users, only: [:create, :edit, :update]
end