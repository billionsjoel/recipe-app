Rails.application.routes.draw do
  get 'users/index'
  get 'users/show'
  get 'recipes/index'
  get 'recipes/show'
  get 'recipes/new'
  devise_for :users

  resources :recipes, only: [:index, :show, :create, :new]

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "users#index"

  resource :user
end
