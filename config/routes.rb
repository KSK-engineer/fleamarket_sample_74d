Rails.application.routes.draw do
  root 'items#index'
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions'
  }
  
  resources :items, only: [:index, :show, :new]
  resources :mypages, only: [:index]
  resources :cards, only: [:new]
  resources :transactions, only: [:new]

  devise_scope :user do
    get '/addresses', to: 'users/registrations#new_address'
    post '/addresses', to: 'users/registrations#create_address'
    # get '/addresses/:id/edit', to: 'users/registrations#edit_address', as: 'edit_address'
    # patch '/addresses/:id', to: 'users/registrations#update_address'
    # put '/addresses/:id', to: 'users/registrations#update_address'
  end

end
