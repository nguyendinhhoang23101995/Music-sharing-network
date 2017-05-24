Rails.application.routes.draw do
  root 'songs#index'

  resources :sessions, only: [:new, :create, :destroy]
  resources :users, only: [:new, :create, :update, :edit, :show] do
  end
  post 'active', to: 'actives#update'
  get 'login', to: 'sessions#new', as: :login
  get 'signup', to: 'users#new', as: :signup
  delete 'logout', to: 'sessions#destroy', as: :logout
end
