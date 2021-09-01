Rails.application.routes.draw do
  scope :api, defaults: { format: :json } do
    devise_for :users, path_names: {
      sign_in: 'login',
      sign_out: 'logout',
      registration: 'signup'
    },
    controllers: {
      sessions: 'users/sessions',
      registrations: 'users/registrations'
    }
    get 'current_user', to: 'current_user#index'
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  namespace :api, defaults: {format: :json } do
    namespace :v1 do
      resources :customers
      resources :regions
      resources :products
      resources :orders
    end
  end
end
