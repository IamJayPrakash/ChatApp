# frozen_string_literal: true

Rails.application.routes.draw do
  # get 'rooms/index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  get '/signin', to: 'sessions#new'
  post '/signin', to: 'sessions#create'
  # delete '/signout', to: 'sessions#destroy'
  delete '/signout', to: 'sessions#destroy'
  resources :rooms
  resources :users
  # resources :users, only: %i[new create]
  resources :rooms do
    resources :messages
  end
  get 'chatpage', to: 'rooms#index'
  get 'aboutjerry', to: 'pages#about'
  get 'rooms/1', as: 'gonow'
  get 'users/1', as: 'gonowuser'
  get 'users/new', to: 'user#create', as: 'signup'
  root 'pages#home'
  # root 'sessions#new'
end
