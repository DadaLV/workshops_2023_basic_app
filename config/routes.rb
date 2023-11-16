Rails.application.routes.draw do
  
  resources :books do
    get 'search', on: :collection
  end
  resources :publishers
  resources :authors
  resources :categories
  resources :book_loans, only: [:create] do
    member do
      post 'cancel'
    end
  end
  resources :book_reservations, only: [:create] do
    member do
      post 'cancel'
    end
  end 
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root 'books#index'
  get '/book-requests', to: 'book_requests#index', as: 'book_requests'
  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?
end
