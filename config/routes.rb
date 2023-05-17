Rails.application.routes.draw do
  root 'pages#index'
  get 'pages/show'
  devise_for :users

  scope :admin do
    resources :users
  end

  # Defines the root path route ("/")
  # root "articles#index"

  get '/', to: 'home#index'
  resources :task
end
