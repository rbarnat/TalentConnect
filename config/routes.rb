Rails.application.routes.draw do
  # HOME PAGE
  root to: "static_pages#home"
  # USERS AND PROFILE PAGES
  devise_for :users
  resources :users, only: [:index, :show]
  # TALENTS PAGES
  resources :talents do
    resources :pictures, only: [:create]
  end
  # APPOINTMENTS PAGES
  resources :appointment, only: [:index, :new, :create, :destroy]
  # PLACES PAGES
  resources :place, only: [:index, :show, :create, :edit, :update]
  # STATIC PAGES : HOME ABOUT CONTACT
  get "/home" => "static_pages#home"
  get "/about" => "static_pages#about"
  get "/contact" => "static_pages#contact"
end
