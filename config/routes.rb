Rails.application.routes.draw do
  devise_for :users
  root to: "home#index"
  resources :products
  resources :users
end
