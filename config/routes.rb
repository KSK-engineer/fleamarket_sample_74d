Rails.application.routes.draw do
  root 'items#index'

  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions'
  }

  get "items/new" == "items#new"
  get "items/:id" == "items#show"
  
  resources :items do
    collection do
      get :search
    end
  end
  resources :registration, only: [:new, :index]
  resources :mypages, only: [:index]
  resources :cards, only: [:new, :create, :show, :destroy]

  devise_scope :user do
    get '/addresses', to: 'users/registrations#new_address'
    post '/addresses', to: 'users/registrations#create_address'
    # get '/addresses/:id/edit', to: 'users/registrations#edit_address', as: 'edit_address'
    # patch '/addresses/:id', to: 'users/registrations#update_address'
    # put '/addresses/:id', to: 'users/registrations#update_address'
  end

  resources :transactions, only: [:new, :index, :create]
end
