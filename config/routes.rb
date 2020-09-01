Rails.application.routes.draw do
  root 'items#index'

  
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions'
  }

  resources :registration, only: [:new, :index]
  resources :items, only: [:index, :show, :new]
  resources :mypages, only: [:index]
  resources :cards, only: [:new, :show, :index] do
    collection do
      post 'show', to: 'cards#show'
      post 'pay', to: 'cards#pay'
      post 'delete', to: 'cards#delete'
    end
  end
  resources :transactions, only: [:new, :index, :create]
end
