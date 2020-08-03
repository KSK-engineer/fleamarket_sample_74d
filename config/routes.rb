Rails.application.routes.draw do
  root 'items#index'
  
  resources :registration, only: [:new, :index]
  resources :items, only: [:index, :show, :new]
  resources :users, only: :index
  resources :cards, only: [:new]
  resources :transactions, only: [:new]

end
