Rails.application.routes.draw do
  root 'songs#index'

  resources :sessions, only: [:new, :create, :destroy]
  resources :users, only: [:new, :create, :update, :edit, :show] do
  end
  resources :actives, only: [:show]
  get 'login', to: 'sessions#new', as: :login
  get 'signup', to: 'users#new', as: :signup
  delete 'logout', to: 'sessions#destroy', as: :logout

  resources :songs do
    resources :comments, only: [:create, :destroy]
  end
end
