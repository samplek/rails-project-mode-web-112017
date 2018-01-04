Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :users

  resources :posts

  resources :sessions

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'

  delete '/logout', to: 'sessions#destroy'

  resources :categories

  resources :comments

  resources :likes

  get '/analytics', to: 'analytics#index'

  get '/analytics/user', to: 'analytics#show', as: 'analytic'

  root 'posts#index'
end
