Rails.application.routes.draw do
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
    resources :vintage_offerings, only: %i[index]
    resources :contributions do
      member do
        patch :update_status
      end
    end
  end

  # buyer
  resources :carbon_credits, only: %i[index]
  resources :contributions, only: %i[new create]

  # seller
  resources :sellers, only: %i[index]
  resources :project_offerings do
    member do
      patch :update_status
    end
  end
  post '/seller/check_name' => 'sellers#check_name', as: :check_name
  resources :vintage_offerings
end
