Rails.application.routes.draw do
  get 'registrations/create'
  devise_for :users
  root to: 'items#index'
  resources :items
end