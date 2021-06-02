Rails.application.routes.draw do
  resources :groups
  resources :film_viewings
  resources :users, only: %i[show destroy new create]

  get 'splash', to: 'sessions#login'
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'

  get 'logout', to: 'sessions#destroy'

  root 'sessions#login'
end
