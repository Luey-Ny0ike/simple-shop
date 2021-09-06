Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  devise_for :users
  namespace :api, defaults: {format: :json } do
    namespace :v1 do
      devise_scope :user do
        post 'signup', to: 'registrations#create'
        post 'login', to: 'sessions#create'
        delete 'logout', to: 'sessions#destroy'
      end
      get 'current_user', to: 'current_user#index'

      resources :customers
      resources :regions
      resources :products
      resources :orders
    end
  end
end
