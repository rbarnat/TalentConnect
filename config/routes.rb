Rails.application.routes.draw do
  #--- HOME PAGE ---
  root to: "static_pages#home"
  get 'search_results' => 'talents#search_results', as: 'search_results'
  devise_for :users
  resources :users, only: [:index, :show]
  resources :talents
  resources :appointment, only: [:index, :new, :create, :destroy]
  resources :place, only: [:index, :show, :create, :edit, :update]
  resources :static_pages, only: [:home, :about, :contact]
end
