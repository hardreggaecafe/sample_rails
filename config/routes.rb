Rails.application.routes.draw do
  root 'pages#index'
  get 'pages/show'
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  get '/', to: 'home#index'
  resources :task
end
