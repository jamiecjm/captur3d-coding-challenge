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

# == Route Map
#
#                   Prefix Verb   URI Pattern                          Controller#Action
#                     cart GET    /cart(.:format)                      cart#show
#                 checkout GET    /checkout(.:format)                  cart#checkout
#                     root GET    /                                    cardboards#index
#         new_user_session GET    /users/sign_in(.:format)             devise/sessions#new
#             user_session POST   /users/sign_in(.:format)             devise/sessions#create
#     destroy_user_session DELETE /users/sign_out(.:format)            devise/sessions#destroy
#        new_user_password GET    /users/password/new(.:format)        devise/passwords#new
#       edit_user_password GET    /users/password/edit(.:format)       devise/passwords#edit
#            user_password PATCH  /users/password(.:format)            devise/passwords#update
#                          PUT    /users/password(.:format)            devise/passwords#update
#                          POST   /users/password(.:format)            devise/passwords#create
# cancel_user_registration GET    /users/cancel(.:format)              devise/registrations#cancel
#    new_user_registration GET    /users/sign_up(.:format)             devise/registrations#new
#   edit_user_registration GET    /users/edit(.:format)                devise/registrations#edit
#        user_registration PATCH  /users(.:format)                     devise/registrations#update
#                          PUT    /users(.:format)                     devise/registrations#update
#                          DELETE /users(.:format)                     devise/registrations#destroy
#                          POST   /users(.:format)                     devise/registrations#create
#              rails_admin        /admin                               RailsAdmin::Engine
#               cardboards GET    /cardboards(.:format)                cardboards#index
#                cardboard GET    /cardboards/:id(.:format)            cardboards#show
#               line_items POST   /line_items(.:format)                line_items#create
#                line_item PATCH  /line_items/:id(.:format)            line_items#update
#                          PUT    /line_items/:id(.:format)            line_items#update
#                          DELETE /line_items/:id(.:format)            line_items#destroy
#              user_orders GET    /users/:user_id/orders(.:format)     orders#index
#               user_order GET    /users/:user_id/orders/:id(.:format) orders#show
# 
# Routes for RailsAdmin::Engine:
#   dashboard GET         /                                      rails_admin/main#dashboard
#       index GET|POST    /:model_name(.:format)                 rails_admin/main#index
#         new GET|POST    /:model_name/new(.:format)             rails_admin/main#new
#      export GET|POST    /:model_name/export(.:format)          rails_admin/main#export
# bulk_delete POST|DELETE /:model_name/bulk_delete(.:format)     rails_admin/main#bulk_delete
# bulk_action POST        /:model_name/bulk_action(.:format)     rails_admin/main#bulk_action
#        show GET         /:model_name/:id(.:format)             rails_admin/main#show
#        edit GET|PUT     /:model_name/:id/edit(.:format)        rails_admin/main#edit
#      delete GET|DELETE  /:model_name/:id/delete(.:format)      rails_admin/main#delete
# show_in_app GET         /:model_name/:id/show_in_app(.:format) rails_admin/main#show_in_app
