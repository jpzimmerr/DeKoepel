Rails.application.routes.draw do
  resources :reservations do
  	resources :companys
  end

  resources :customers

  root 'koepel#index'
end
