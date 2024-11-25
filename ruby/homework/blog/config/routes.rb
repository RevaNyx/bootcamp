Rails.application.routes.draw do
  get "authors/new"
  get "authors/create"
  get "authors/show"
  get "authors/edit"
  get "authors/update"
  get "authors/destroy"
  devise_for :users
  get "donations/new"
  get "donations/create"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  



  resources :categories
    resources :authors

    resources :donations, only: [:new, :create]

    resources :articles do
      resources :comments, only: [:create, :destroy]  # Only allow create and destroy actions for comments
    end
    
  
  # Close the articles block
  # Close the categories block


  resources :donations, only: [:new, :create]
  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/*
  get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker
  get "manifest" => "rails/pwa#manifest", as: :pwa_manifest

  # Defines the root path route ("/")
  root "categories#index"
end
