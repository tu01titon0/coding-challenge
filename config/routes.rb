Rails.application.routes.draw do
  namespace :api do
    resources :transactions, only: [:index]
    resources :users do
      resources :transactions, only: [:index], format: 'json'
    end
  end


  root "static_pages#home"
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :accounts
  resources :transactions
end
