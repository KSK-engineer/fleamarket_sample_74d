Rails.application.routes.draw do
  root 'items#index'
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions'
  }
  
  resources :items, only: [:index, :show, :new]
  resources :registration, only: [:new, :index]
  resources :mypages, only: [:index]
  resources :cards, only: [:new]
  resources :transactions, only: [:new]

end
