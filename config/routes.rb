Rails.application.routes.draw do
  devise_for :users
  root 'items#index'
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions'
  }
  
  resources :items, only: [:index, :show, :new]
  resources :users, only: [:index, :new, :create]
  resources :registration, only: [:new, :index]
  resources :items, only: [:index, :show]
  resources :mypages, only: [:index]
  resources :cards, only: [:new]
  resources :transactions, only: [:new]

end
