Rails.application.routes.draw do
  get 'car_search/index' => 'car_search#index', :as => 'search_page'
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  root to: 'manufacturers#index'
  # get 'cars/index'
  # get 'cars/show'
  # get 'manufacturers/index'
  # get 'manufacturers/show'
  resources :cars, only: %i[index show]

  resources :manufacturers, only: %i[index show]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
