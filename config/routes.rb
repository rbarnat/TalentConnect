Rails.application.routes.draw do
  devise_for :users
  resources :users, only: [:index, :show]
  # Appointment creation is accessible through the talent show page 
  resources :talents
  resources :talents, only: [:show] do 
    resources :appointments, only: [:new, :create]
  end
  resources :appointments, only: [:index, :destroy]
  resources :places, only: [:index, :show, :create, :edit, :update]
  resources :static_pages, only: [:home, :about, :contact]
end
