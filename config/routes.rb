Rails.application.routes.draw do
  root to: 'home#index'

  get '/auth/facebook/callback', to: 'sessions#create'
  get '/auth/failure', to: 'home#index'
  resources :sessions, only: [:destroy]

end
