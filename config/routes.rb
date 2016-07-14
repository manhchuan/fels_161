Rails.application.routes.draw do
  get "sessions/new"

  root "static_pages#home"
  get "signup" => "users#new"
  get "login" => "sessions#new"
  post "login" => "sessions#create"
  delete "logout" => "sessions#destroy"
  resources :users
  resources :categories, only: [:index, :show]
  namespace :admin do
    resources :users, only: [:index, :destroy]
    resources :categories
    resources :questions
  end
  resources :relationships, only: [:create, :destroy, :show]
end
