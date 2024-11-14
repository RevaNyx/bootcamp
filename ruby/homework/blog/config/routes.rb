Rails.application.routes.draw do
  resources :authors
  resources :categories do
    resources :articles
  end
end

