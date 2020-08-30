Rails.application.routes.draw do
  root 'items#index'

  resources :registration, only: [:new, :index]
  resources :items, only: [:index, :show]
  resources :users, only: :index
  resources :cards, only: [:new, :show, :index] do
    collection do
      post 'show', to: 'cards#show'
      post 'pay', to: 'cards#pay'
      post 'delete', to: 'cards#delete'
    end
  end
  resources :items, only: [:index, :show]
  resources :transactions, only: [:new, :index, :create]

end
