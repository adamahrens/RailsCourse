Rails.application.routes.draw do
 
  root 'pages#landing'

  devise_for :users

  resources :tracks
  resources :users , only: [:index]
  
  get 'privacy', to: 'pages#privacy'
  get 'activity',  to: 'activity#index'
  get 'about', to: 'pages#about'
  post 'search', to: 'tracks#index'
end
