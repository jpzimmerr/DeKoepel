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

  get '/contact' => 'sites#contact'
  get '/zaalverhuur' => 'sites#zaalverhuur'
  get '/arrangementen' => 'sites#arrangementen'
  get '/dekoepel' => 'sites#dekoepel'
end
