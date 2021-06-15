Rails.application.routes.draw do
  get 'splash', to: 'sessions#login'
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  get 'logout', to: 'sessions#destroy'
  get 'film_viewings/unassigned', to: 'film_viewings#unassigned'

  root 'users#home'

  resources :groups, only: %i[show destroy new create index update edit]
  resources :film_viewings, only: %i[show destroy new create index]
  resources :users, only: %i[show destroy new create]
end
