Rails.application.routes.draw do
  root to: 'home_pages#index'
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  devise_scope :user do
    get 'users/sign_in', to: 'users/sessions#new', as: :new_user_session
    get 'users/sign_out', to: 'users/sessions#destroy', as: :destroy_user_session
  end
  get '/users' => 'users#index', as: :user_root # creates user_root_path
  get 'users/index'
  get 'home/index'
  resources :home
  resources :users do
    member do
      get :meetings
      get :payment
      get :thank_you, to: 'users/:id/thank_you'
      post :checkout
    end
  end
  resources :home_pages
  resources :events do
    member do
      get :delete
    end
  end
  # resources :users, only [:index, :show]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
