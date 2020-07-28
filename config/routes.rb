Rails.application.routes.draw do
  root 'cards#new'
  resources :users, only: :index
  resources :cards, only: [:new]
end
