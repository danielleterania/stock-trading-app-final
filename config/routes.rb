# config/routes.rb
Rails.application.routes.draw do
  devise_for :users, controllers: {
    sessions: "users/sessions",
    registrations: "users/registrations",
    confirmations: "users/confirmations"
  }

  namespace :admin do
    resources :users, only: [:index, :show, :edit, :update] do
      member do
        patch :approve
      end
    end
  end
  
  root to: 'home#index'
end
