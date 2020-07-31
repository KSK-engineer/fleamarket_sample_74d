Rails.application.routes.draw do
  root 'transactions#new'
  resources :cards, only: [:new]
  resources :transactions, only: [:new]
end
