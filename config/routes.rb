Rails.application.routes.draw do

  root to: 'home#index'

  get   '/auth/facebook/callback',  to: 'sessions#new'
  get   '/auth/failure',            to: 'home#index'
  get   '/purchases/:id/preview',   to: 'purchases#preview', as: "preview"
  resources :sessions,            only: [:destroy]
  resources :user,                only: [:new, :update]
  resources :letters,             only: [:new, :create]
  resources :purchases,           only: [:new, :create, :show]
  resources :charges
end
