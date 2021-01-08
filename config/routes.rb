Rails.application.routes.draw do
  root 'pages#landing'
  get 'privacy', to: 'pages#privacy'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
