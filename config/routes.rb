Rails.application.routes.draw do
  get 'registrations/new'
  devise_for :users
  resources :users, only: [:edit, :update]
end