Rails.application.routes.draw do
  devise_for :users, controllers: {
    sessions: 'users/sessions'
  }
  root to: 'recipes#index'
  get '/recipes' => 'recipes#index'
  get '/recipes/favorites' => 'recipes#favorites'
  get '/recipes/muted' => 'recipes#muted'
  get '/recipes/:id' => 'recipes#show'
  get '/mypantry' => 'pantry_items#index'
  get '/mealplanner' => 'recipes#mealplanner'
  get '/ingredients' => 'ingredients#label'
  patch '/ingredients' => 'ingredients#update'

  get 'login' => 'users#login'

  patch 'favorite/:id' => 'favorites#update'
  delete 'favorite/:id' => 'favorites#destroy'
  patch 'mute/:id' => 'mutes#update'
  delete 'mute/:id' => 'mute#destroy'

  namespace :api do
    namespace :v1 do
      get '/mypantry/:id' => 'pantry_items#index'
      get '/pantry_items/:id' => 'pantry_items#show'
      post '/pantry_items' => 'pantry_items#create'
    end
  end
end

=begin
 Prefix Verb   URI Pattern                    Controller#Action
        new_user_session GET    /users/sign_in(.:format)       users/sessions#new
            user_session POST   /users/sign_in(.:format)       users/sessions#create
    destroy_user_session DELETE /users/sign_out(.:format)      users/sessions#destroy
       new_user_password GET    /users/password/new(.:format)  devise/passwords#new
      edit_user_password GET    /users/password/edit(.:format) devise/passwords#edit
           user_password PATCH  /users/password(.:format)      devise/passwords#update
                         PUT    /users/password(.:format)      devise/passwords#update
                         POST   /users/password(.:format)      devise/passwords#create
cancel_user_registration GET    /users/cancel(.:format)        devise/registrations#cancel
   new_user_registration GET    /users/sign_up(.:format)       devise/registrations#new
  edit_user_registration GET    /users/edit(.:format)          devise/registrations#edit
       user_registration PATCH  /users(.:format)               devise/registrations#update
                         PUT    /users(.:format)               devise/registrations#update
                         DELETE /users(.:format)               devise/registrations#destroy
                         POST   /users(.:format)               devise/registrations#create
                    root GET    /                              recipes#index
                 recipes GET    /recipes(.:format)             recipes#index
                         GET    /recipes/:id(.:format)         recipes#show
                mypantry GET    /mypantry(.:format)            pantry_items#index
             mealplanner GET    /mealplanner(.:format)         recipes#mealplanner
                   login GET    /login(.:format)               users#login
=end
