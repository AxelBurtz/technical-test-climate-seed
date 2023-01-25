Rails.application.routes.draw do
  get 'sellers/index'
  devise_for :users
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  # admin
  namespace :admin do
    resources :projects
    resources :vintages
    resources :sellers, only: %i[index new create edit update destroy]
    resources :buyers
  end

  # buyer
  namespace :buyer do

  end

  # seller
  resources :sellers, only: %i[index]
  resources :project_offerings
  post '/seller/check_name' => 'sellers#check_name', as: :check_name
  resources :vintage_offerings

end
