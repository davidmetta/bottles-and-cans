Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#landing'
  get 'home', to: 'pages#home', as: :home

  resources :pickups

  post 'pickups/:id/reserve', to: 'pickups#reserve', as: :reserve
  post 'pickups/:id/completed', to: 'pickups#completed', as: :completed
end
