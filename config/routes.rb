Rails.application.routes.draw do
  root 'items#index'
  resources :users, only: :index
  resources :cards, only: [:new]
  resources :items, only: [:index, :show]
  resources :transactions, only: [:new]
end
