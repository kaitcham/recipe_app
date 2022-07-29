Rails.application.routes.draw do
  devise_for :users
  resources :foods
  resources :recipes
  resources :recipe_foods
  get '/public_recipes', to: 'public_recipes#index'
  get '/shopping_lists', to: 'shopping_lists#index'
  # Defines the root path route ("/")
  root "home#index"
end
