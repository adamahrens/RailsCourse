Rails.application.routes.draw do
  resources :tracks
  root 'pages#landing'
  get 'privacy', to: 'pages#privacy'
  get 'about', to: 'pages#about'
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
