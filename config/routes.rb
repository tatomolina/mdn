Rails.application.routes.draw do

  devise_for :users
  resources :orders
  resources :clients
  root 'orders#index'
end
