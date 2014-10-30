Rails.application.routes.draw do
  resources :reservations

  root 'koepel#index'
end
