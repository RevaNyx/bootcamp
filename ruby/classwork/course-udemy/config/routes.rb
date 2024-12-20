Rails.application.routes.draw do
  devise_for :users, :controllers => { registrations: 'registrations' }
  root "pages#index"

resources :users
resources :pages, only: [:show]


  
  # Correct the routes by specifying the controller and action
  get "/contact", to: "pages#contact"
  get "/about", to: "pages#about"
 

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/*
  get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker
  get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
end
