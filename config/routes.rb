Rails.application.routes.draw do
  devise_for :users, controllers: {
    sessions: "users/sessions",
    registrations: "users/registrations",
    confirmations: "users/confirmations"
  }
  # Admin routes
  namespace :admin do
    resources :users, only: [:index, :show, :edit, :update]
  end
  
  # Define root path
  root to: 'home#index'
end
