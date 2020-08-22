Rails.application.routes.draw do
  devise_for :users
  root 'items#index'
  resources :categories, only: [:index, :show] 
  resources :items, except: :show
  #get 'items',to: 'categories/show'
end
