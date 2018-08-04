Rails.application.routes.draw do
  get 'sessions/new'

  root to: 'instagrams#index'

  resources :instagrams do
    collection do
      post :confirm
    end
  end

  resources :sessions, only: %i[new create destroy]
  resources :users
  resources :favorites, only: %i[create destroy]

  mount LetterOpenerWeb::Engine, at: '/inbox' if Rails.env.development?
end
