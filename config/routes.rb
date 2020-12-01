Rails.application.routes.draw do
  devise_for :users
  resources :users, only: [:index, :show]
  resources :appointment, only: [:index, :new, :create, :destroy]
  ressources :place, only: [:index, :show, :create, :edit, :update]
end
