Rails.application.routes.draw do
  root 'home#index'
  get 'users/index'
  get 'home/index'
  resources :home
  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
