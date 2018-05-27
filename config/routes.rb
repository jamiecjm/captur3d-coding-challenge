Rails.application.routes.draw do


  get 'cart', to: 'cart#show', as: 'cart'
  get 'checkout', to: 'cart#checkout', as: 'checkout'

  root 'cardboards#index'

  devise_for :users
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  resources :cardboards, only: [:index, :show]
  resources :line_items, only: [:create, :update, :destroy]
  resources :users, except: [:index, :new, :create, :edit, :update, :destroy, :show] do
    resources :orders, only: [:index, :show]
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
