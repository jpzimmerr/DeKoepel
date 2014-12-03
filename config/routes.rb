Rails.application.routes.draw do
  get 'customers/index'

  get 'customer/index'

  resources :reservations
  resources :customers

  root 'koepel#index'
end
