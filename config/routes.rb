Rails.application.routes.draw do
  devise_for :users, controllers: {
    sessions: 'users/sessions'
  }
  root to: 'recipes#index'
  get '/recipes' => 'recipes#index'
  get '/recipes/:id' => 'recipes#show'

  get '/mypantry' => 'pantry_items#index'

  get '/mealplanner' => 'recipes#mealplanner'

  get 'login' => 'users#login'
end
