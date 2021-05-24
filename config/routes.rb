Rails.application.routes.draw do
  resources :groups
  resources :film_viewings
  resources :users

  get 'login', to: 'sessions#login'
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'

  get 'logout', to: 'sessions#destroy'

  root "sessions#login"
end
