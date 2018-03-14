Rails.application.routes.draw do

  resource :orders
  root 'orders#index'
end
