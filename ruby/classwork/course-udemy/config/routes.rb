Rails.application.routes.draw do
  devise_for :users
  root to: "pages#index"
  
  # Correct the routes by specifying the controller and action
  get "pages/contact", to: "pages#contact"
  get "pages/about", to: "pages#about"

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/*
  get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker
  get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
end
