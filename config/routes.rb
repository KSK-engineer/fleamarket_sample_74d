Rails.application.routes.draw do
  root 'items#index'
  resources :registration, only: [:new, :index]
end
