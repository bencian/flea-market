Rails.application.routes.draw do
  namespace :admin do
    resources :products
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "frontend/main#index"

  scope :admin do
    root to: "backend/main#index", as: 'admin_root'
  end
  devise_for :admin, controllers: {
    sessions: 'admins/sessions',
    registrations: 'admins/registrations'
  }

end

# /admin -> /backend/main#index

# /admin/backend/main#index