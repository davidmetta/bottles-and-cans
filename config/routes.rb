Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  resources :pickups, except: :edit
  get :confirmation, to: 'pickups#confirmation'

  post 'pickups/:id/reserve', to: 'pickups#reserve', as: :reserve
end
