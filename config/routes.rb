Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'registrations'
  }
  get 'car_search/index' => 'car_search#index', :as => 'search_page'
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  root to: 'cars#index'
  # get 'cars/index'
  # get 'cars/show'
  # get 'manufacturers/index'
  # get 'manufacturers/show'
  # resources :home, only: %i[index]
  resources :cars, only: %i[index show]
  resources :cart, only: %i[create destroy index]
  resources :manufacturers, only: %i[index show]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
