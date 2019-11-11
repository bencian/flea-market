Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "frontend/main#index"
  resources :products, module: :frontend, only: [:index, :show]
  namespace :admin, module: :backend do
    root action: :index, controller: :main
    resources :categories, except: :show
    resources :tags, except: :show
    resources :products
    resources :sliders, except: :index
    resources :users
    resources :frontend_configurations, only: [:index, :edit, :update]
  end
  devise_for :admin, controllers: {
    sessions: 'admins/sessions',
    registrations: 'admins/registrations'
  }
end
