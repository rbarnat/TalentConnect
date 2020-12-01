Rails.application.routes.draw do
  devise_for :users
  resources :users, only: [:index, :show]
  resources :talents
  resources :appointment, only: [:index, :new, :create, :destroy]
  resources :place, only: [:index, :show, :create, :edit, :update]
  resources :static_pages, only: [:home, :about, :contact]
end
