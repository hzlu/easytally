# == Route Map
#
#                   Prefix Verb   URI Pattern                       Controller#Action
#         new_user_session GET    /users/sign_in(.:format)          users/sessions#new
#             user_session POST   /users/sign_in(.:format)          users/sessions#create
#     destroy_user_session DELETE /users/sign_out(.:format)         users/sessions#destroy
#            user_password POST   /users/password(.:format)         devise/passwords#create
#        new_user_password GET    /users/password/new(.:format)     devise/passwords#new
#       edit_user_password GET    /users/password/edit(.:format)    devise/passwords#edit
#                          PATCH  /users/password(.:format)         devise/passwords#update
#                          PUT    /users/password(.:format)         devise/passwords#update
# cancel_user_registration GET    /users/cancel(.:format)           devise/registrations#cancel
#        user_registration POST   /users(.:format)                  devise/registrations#create
#    new_user_registration GET    /users/sign_up(.:format)          devise/registrations#new
#   edit_user_registration GET    /users/edit(.:format)             devise/registrations#edit
#                          PATCH  /users(.:format)                  devise/registrations#update
#                          PUT    /users(.:format)                  devise/registrations#update
#                          DELETE /users(.:format)                  devise/registrations#destroy
#        user_confirmation POST   /users/confirmation(.:format)     devise/confirmations#create
#    new_user_confirmation GET    /users/confirmation/new(.:format) devise/confirmations#new
#                          GET    /users/confirmation(.:format)     devise/confirmations#show
#              user_unlock POST   /users/unlock(.:format)           devise/unlocks#create
#          new_user_unlock GET    /users/unlock/new(.:format)       devise/unlocks#new
#                          GET    /users/unlock(.:format)           devise/unlocks#show
#                     root GET    /                                 tallies#home
#             home_tallies GET    /tallies/home(.:format)           tallies#home
#       tally_data_tallies GET    /tallies/tally_data(.:format)     tallies#tally_data
#                  tallies GET    /tallies(.:format)                tallies#index
#                          POST   /tallies(.:format)                tallies#create
#                    tally DELETE /tallies/:id(.:format)            tallies#destroy
#              tally_types GET    /tally_types(.:format)            tally_types#index
#                          POST   /tally_types(.:format)            tally_types#create
#           new_tally_type GET    /tally_types/new(.:format)        tally_types#new
#          edit_tally_type GET    /tally_types/:id/edit(.:format)   tally_types#edit
#               tally_type GET    /tally_types/:id(.:format)        tally_types#show
#                          PATCH  /tally_types/:id(.:format)        tally_types#update
#                          PUT    /tally_types/:id(.:format)        tally_types#update
#                          DELETE /tally_types/:id(.:format)        tally_types#destroy
#             income_types GET    /income_types(.:format)           income_types#index
#                          POST   /income_types(.:format)           income_types#create
#          new_income_type GET    /income_types/new(.:format)       income_types#new
#         edit_income_type GET    /income_types/:id/edit(.:format)  income_types#edit
#              income_type GET    /income_types/:id(.:format)       income_types#show
#                          PATCH  /income_types/:id(.:format)       income_types#update
#                          PUT    /income_types/:id(.:format)       income_types#update
#                          DELETE /income_types/:id(.:format)       income_types#destroy
#

Rails.application.routes.draw do

  # The priority is based upon order of creation: first created -> highest priority.
  devise_for :users, controllers: { sessions: "users/sessions" }

  root 'tallies#home'

  resources :tallies, only: [:index, :create, :destroy] do
    collection do
      get :home
      get :tally_data
    end
  end

  resources :tally_types
  resources :income_types

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
