Rails.application.routes.draw do
  
  resources :reservations do
  	resources :customers do
  		resources :companies
  	end
  end
  
  root 'koepel#index'
end
