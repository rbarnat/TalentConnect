Rails.application.routes.draw do
  devise_for :users
  resources :appointment, only: [:index, :new, :create, :destroy]
end
