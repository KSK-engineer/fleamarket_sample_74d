Rails.application.routes.draw do
  devise_for :users
  root 'items#index'
  resources :products, except: :show
  resources :items, only: [:index, :show, :new, :edit, :create, :destroy] do
    collection do
      get 'get_category_children', defaults: { format: 'json' }
      get 'get_category_grandchildren', defaults: { format: 'json' }
    end
  end
  resources :registration, only: [:new, :index]
  resources :mypages, only: [:index]
  resources :cards, only: [:new]
  resources :transactions, only: [:new]
end
