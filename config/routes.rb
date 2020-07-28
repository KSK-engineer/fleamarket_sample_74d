Rails.application.routes.draw do
  root 'cards#new'
  resources :cards, only: [:new]
end
