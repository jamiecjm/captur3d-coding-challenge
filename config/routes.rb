Rails.application.routes.draw do
  resources :cardboards
  devise_for :models
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
