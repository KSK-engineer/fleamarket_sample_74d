Rails.application.routes.draw do
  devise_for :users
  root 'items#index'
  
  resources :items, only: [:index, :show, :new]
  resources :registration, only: [:new, :index]
  resources :items, only: [:index, :show]
  resources :mypages, only: [:index]
  resources :cards, only: [:new]
  resources :transactions, only: [:new]

end
