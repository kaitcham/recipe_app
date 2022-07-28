Rails.application.routes.draw do
  devise_for :users
  resources :foods
  resources :recipes
  get '/public_recipes', to: 'public_recipes#index'
  # Defines the root path route ("/")
  root "home#index"
end
