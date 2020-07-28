Rails.application.routes.draw do
  root 'items#index'
  resources :cards, only: [:new]
  resources :items, only: [:index]
end
