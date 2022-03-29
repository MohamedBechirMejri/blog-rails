Rails.application.routes.draw do
  resources :comments, only: %i[create destroy]
  resources :posts
  devise_for :users
  resources :users, only: %i[index show]
  root 'posts#index'
end
