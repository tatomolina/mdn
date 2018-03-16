Rails.application.routes.draw do

  resources :orders
  resources :clients
  root 'orders#index'
end
