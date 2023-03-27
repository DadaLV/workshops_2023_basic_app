# frozen_string_literal: true

Rails.application.routes.draw do
  resources :books
  resources :publishers
  resources :authors
  resources :categories
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root 'books#index'
end
