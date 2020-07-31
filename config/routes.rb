Rails.application.routes.draw do
  root 'items#index'
  resources :registration, only: [:new, :index]
  resources :items, only: [:index, :show]

end
