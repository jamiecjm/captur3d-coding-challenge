Rails.application.routes.draw do

  root 'pages#home'

  devise_for :users
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  resources :cardboards
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
