Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "frontend/main#index"

  scope :admin do
    root to: "backend/main#index", as: 'admin_root'
    resources :categories, :module => 'backend', except: :show 
    resources :tags, :module => 'backend', except: :show
    resources :products, :module => 'backend'
    resources :sliders, :module => 'backend', except: :index
    resources :users, :module => 'backend'
  end
  devise_for :admin, controllers: {
    sessions: 'admins/sessions',
    registrations: 'admins/registrations'
  }

end
