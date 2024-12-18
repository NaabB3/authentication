Rails.application.routes.draw do
  devise_for :admins, controllers: { sessions: 'admins/sessions', registrations: 'admins/registrations' }
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/*
  get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker
  get "manifest" => "rails/pwa#manifest", as: :pwa_manifest

  # Defines the root path route ("/")
  # root "posts#index"
  
  get 'customers/edit_customer', to: 'customers#edit_customer', as: 'edit_customer'
  post 'customers/manage_customer', to: 'customers#manage_customer', as: 'manage_customer'


  resources :roles
  resources :staff_users
  resources :customers, only: [:edit, :update]
  resources :dashboard, only: [:index]
  root "dashboard#index"

  
end
