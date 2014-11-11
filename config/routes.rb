Rails.application.routes.draw do
  resources :reservations do
  	resources :companies
  end

  resources :customers

  root 'koepel#index'
end
