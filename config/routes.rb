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

  get 'foods/index' , to: 'foods#index'
  get 'foods' , to: 'foods#index'
  get 'foods/show' , to: 'foods#show'
  get 'foods/new' , to: 'foods#new'
  get 'foods/delete' , to: 'foods#delete'

  resource :foods, only: [:index, :show, :new, :create]
end
