Rails.application.routes.draw do
  get 'sessions/new'

  root to: 'instagrams#index'

  resources :instagrams do
    collection do
      post :confirm
    end
  end

  resources :sessions, only: [:new, :create, :destroy]
  resources :users
  resources :favorites, only: [:create, :destroy]
end
