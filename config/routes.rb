Rails.application.routes.draw do
  # get 'orders/index'
  devise_for :users
  root to: 'items#index'
  resources :users
  resources :items do
    resources :orders
  end
end