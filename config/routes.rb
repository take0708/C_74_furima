Rails.application.routes.draw do
  root 'items#index'
  resources :categories, only: [:index] 
end
