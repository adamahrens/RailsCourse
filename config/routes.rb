Rails.application.routes.draw do
  root 'pages#landing'

  devise_for :users
  resources :tracks
  
  get 'privacy', to: 'pages#privacy'
  get 'about', to: 'pages#about'

  post 'search', to: 'tracks#index'
end
