Rails.application.routes.draw do
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations',
    confirmations: 'users/confirmations'
  }

  # Routes for stocks
  resources :stocks, only: [:index] do
    member do
      post 'add_to_portfolio'
    end
  end
    

  # Routes for portfolios
  resources :portfolios, only: [:index] do
    member do
      patch 'sell'
      post 'buy'
    end
    member do
      post 'add_to_portfolio'
    end
  end

  # Routes for user transactions
  resources :transactions, only: [:index]

  # Admin routes
  namespace :admin do
    resources :transactions, only: [:index] # For admins to view all transactions
    resources :users, only: [:index, :show, :edit, :update] do
      member do
        patch :approve
      end
      collection do
        get :pending_traders
      end
    end
  end

  # Root route
  root to: 'home#index'
end
