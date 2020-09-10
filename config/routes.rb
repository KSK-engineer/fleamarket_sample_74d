Rails.application.routes.draw do
  root 'items#index'

  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions'
  }

  get "items/new" == "items#new"
  get "items/:id" == "items#show"
  
  resources :registration, only: [:new, :index]
  resources :items, only: [:index, :show, :new]
  resources :mypages, only: [:index]

  devise_scope :user do
    get '/addresses', to: 'users/registrations#new_address'
    post '/addresses', to: 'users/registrations#create_address'
    # get '/addresses/:id/edit', to: 'users/registrations#edit_address', as: 'edit_address'
    # patch '/addresses/:id', to: 'users/registrations#update_address'
    # put '/addresses/:id', to: 'users/registrations#update_address'
  end

  resources :cards, only: [:new, :show, :index] do
    collection do
      post 'show', to: 'cards#show'
      post 'pay', to: 'cards#pay'
      post 'delete', to: 'cards#delete'
    end
  end
  resources :transactions, only: [:new, :index, :create]
end
