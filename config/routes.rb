Rails.application.routes.draw do
  devise_for :users
  resources :users, only: [:index, :show]
  resources :talents
  resources :appointment, only: [:index, :new, :create, :destroy]
end
