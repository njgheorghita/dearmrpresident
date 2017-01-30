Rails.application.routes.draw do
  root to: 'home#index'

  get '/auth/facebook/callback', to: 'sessions#create'
  
end
