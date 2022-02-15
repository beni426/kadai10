Rails.application.routes.draw do
  root to: 'posts#index'
  get 'users/new'
  get 'sessions/new'
  resources :posts do
    collection do
      post :confirm
    end
  end
  resources :users, only: [:show] do 
    get :favorites, on: :member
  end
  resources :users, only: [:new, :create, :show,:edit]
  resources :sessions, only: [:new, :create, :destroy]
  resources :favorites, only: [:create, :destroy]
  mount LetterOpenerWeb::Engine, at: '/letter_opener'
end
