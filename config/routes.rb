Rails.application.routes.draw do
  # STATIC PAGES : HOME ABOUT CONTACT KIT UI
  get "/home" => "static_pages#home"
  get "/about" => "static_pages#about"
  get "/contact" => "static_pages#contact"
  get "/ui_kit" => "static_pages#ui_kit"
  # SEARCH RESULT PAGEœ
  get 'search_results' => 'talents#search_results', as: 'search_results'
  
  # HOME PAGE
  root to: "static_pages#home"
  # ADMIN ROUTES
  get "/admin" => "admins/admins#show"
  namespace :admins, only: [:index] do
    resources :talents, only: [:index, :edit, :destroy]
    resources :categories, only: [:create, :destroy]
  end
  # USERS AND PROFILE PAGES
  devise_for :users, controllers: { registrations: 'registrations' }
  resources :users, only: [:index, :show]
  # ADD MENTOR SHOW ACTION IN USER CONTROLLER (member argument is for specific user so id is needed, collection argument don't need id)
  resources :users do
    get 'mentor_show', :on => :member
    get 'apprentice_show', :on => :member
  end
  # TALENTS PAGES
  resources :talents do
    resources :pictures, only: [:create]
    resources :reviews, only: [:show]
  end
  # APPOINTMENT CREATION IS ACCESSIBLE THROUGH THE TALENT SHOW PAGE 
  resources :talents, only: [:show] do 
    resources :appointments, only: [:new, :create] do 
      resources :reviews, only: [:new, :create]
      resources :charges, only: [:new, :create]
    end
  end
  # APPOINTMENTS INDEX, UPDATE AND DESTROY PAGES
  resources :appointments, only: [:index, :destroy, :show, :update]
  # PLACES PAGES
  resources :places, only: [:index, :show, :create, :edit, :update]
end
