Rails.application.routes.draw do
  devise_for :users
  root 'items#index'
  resources :categories, only: [:index, :show] 
  resources :creditcards, only: [:index, :new, :create, :show, :destroy] do
    member do
      post 'pay'
    end
  end
end
