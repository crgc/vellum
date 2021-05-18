Rails.application.routes.draw do
  resources :film_viewings
  resources :users
  root "users#index"
end
