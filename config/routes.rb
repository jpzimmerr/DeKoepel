Rails.application.routes.draw do
  get 'sites/index'

  get 'customers/index'

  get 'customer/index'

  resources :reservations
  resources :customers
  resources :sites
  resources :posts
  resources :pages

  root 'sites#index'
end
