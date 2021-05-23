Rails.application.routes.draw do
  resources :groups
  resources :film_viewings
  resources :users

  root "users#index"
end
