Rails.application.routes.draw do
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations',
    confirmations: 'users/confirmations'
  }

  resources :stocks, only: [:index] do
    member do
      patch :add_to_portfolio
    end
  end

  resources :portfolios, only: [:index]

  namespace :admin do
    resources :transactions, only: [:index]
    resources :users, only: [:index, :show, :edit, :update] do
      member do
        patch :approve
      end
      collection do
        get :pending_traders
      end
    end
  end
    

  root to: 'home#index'
end
