Rails.application.routes.draw do
  get 'sites/index'

  get 'customers/index'

  get 'customer/index'

  resources :reservations
  resources :customers
  resources :sites
  resources :posts
  resources :pages
  resources :products
  resources :arrangements

  root 'sites#index'

  match '/contact',     to: 'sites#contact',             via: 'get'
  resources "contacts", only: [:new, :create]
end
