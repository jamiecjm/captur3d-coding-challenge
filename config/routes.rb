Rails.application.routes.draw do

  get 'cart', to: 'cart#show', as: 'cart'

  root 'cardboards#index'

  devise_for :users
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  resources :cardboards, only: [:index, :show]
  resources :line_items, only: [:create, :update, :destroy]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
