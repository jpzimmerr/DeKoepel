Rails.application.routes.draw do
  resources :reservations 
  	
  resources :companies
  
  resources :customers

  root 'koepel#index'
end
