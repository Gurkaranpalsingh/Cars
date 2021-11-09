Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  # get 'cars/index'
  # get 'cars/show'
  # get 'manufacturers/index'
  # get 'manufacturers/show'
  resources :cars, only: %i[index show]

  resources :manufacturers, only: %i[index show]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
