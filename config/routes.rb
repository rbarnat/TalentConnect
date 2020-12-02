Rails.application.routes.draw do
  get 'static_pages/home'
  get 'static_pages/about'
  get 'static_pages/contact'
  get 'static_pages/kit_ui'
  
  # HOME PAGE
  root to: "static_pages#home"
  # USERS AND PROFILE PAGES
  devise_for :users
  resources :users, only: [:index, :show]
  # TALENTS PAGES
  resources :talents do
    resources :pictures, only: [:create]
  end
  # Appointment creation is accessible through the talent show page 
  resources :talents, only: [:show] do 
    resources :appointments, only: [:new, :create]
  end
  # APPOINTMENTS INDEX AND DESTROY PAGES
  resources :appointments, only: [:index, :destroy]
  # PLACES PAGES
  resources :places, only: [:index, :show, :create, :edit, :update]
  # STATIC PAGES : HOME ABOUT CONTACT
  get "/home" => "static_pages#home"
  get "/about" => "static_pages#about"
  get "/contact" => "static_pages#contact"
end
