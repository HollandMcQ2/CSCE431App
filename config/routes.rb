Rails.application.routes.draw do
  get 'users/index'
  resources :home
  resources :users
  resources :events
  # resources :users, only [:index, :show]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
