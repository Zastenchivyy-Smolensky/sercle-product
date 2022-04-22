Rails.application.routes.draw do
  root to: "home#index"
  devise_for :users
  resources :products do
    resource :favorites, only: [:create, :destroy]
  end
  resources :users
end
