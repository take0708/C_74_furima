Rails.application.routes.draw do
  root 'items#index'
  resources :items, except: :show
  get'item/new',to:'items#new'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
