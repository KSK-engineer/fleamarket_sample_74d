Rails.application.routes.draw do
  root 'transcations#new'
  resources :cards, only: [:new]
  resources :transcations, only: [:new]
end
