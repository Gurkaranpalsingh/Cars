Rails.application.routes.draw do
  resources :order_items
  get 'contact_us/permalink'
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
  resources :page, except: [:show]
  get '/page/:permalink' => 'page#permalink', as: 'permalink'

  resources :cars, only: %i[index show]

  resources :cart, only: %i[create destroy index]
  resources :manufacturers, only: %i[index show]
  scope '/checkout' do
    post 'create',  to: 'checkout#create',  as: 'checkout_create'
    get  'success', to: 'checkout#success', as: 'checkout_success'
    get  'cancel',  to: 'checkout#cancel',  as: 'checkout_cancel'
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
