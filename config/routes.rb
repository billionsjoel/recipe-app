Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "users#index"

  resource :user

  get 'foods/index' , to: 'foods#index'
  get 'foods' , to: 'foods#index'
  get 'foods/show' , to: 'foods#show'
  get 'foods/new' , to: 'foods#new'
  get 'foods/delete' , to: 'foods#delete'
  get 'general_shopping_list' , to: 'foods#list'

  resource :foods, only: [:index, :show, :new, :create]
end
