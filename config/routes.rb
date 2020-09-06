Rails.application.routes.draw do
  get 'transactions/index'
  devise_for :users
  root to: 'items#index'
  resources :users
  resources :items
  resources :transactions
end