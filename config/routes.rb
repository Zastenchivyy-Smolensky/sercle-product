Rails.application.routes.draw do

  root to: "home#index"
  devise_for :users
  resources :products do
    resource :favorites, only: [:create, :destroy]
    resource :comments, only: [:create]
  end
  resources :comments, only: [:destroy]
  resources :users do
    resource :relationships, only: [:create, :destroy]
    get 'follows', on: :member
    get 'followers', on: :member
  end
end
