Rails.application.routes.draw do

  root to: 'home#index'

  get '/auth/facebook/callback',  to: 'sessions#new'
  get '/auth/failure',            to: 'home#index'
  resources :sessions,            only: [:destroy]
  resources :user,                only: [:new, :update]
  resources :letters,              only: [:new, :create]

end
