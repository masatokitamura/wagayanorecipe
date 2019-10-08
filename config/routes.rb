Rails.application.routes.draw do
  root to: "toppages#index"
  
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  
  get 'signup', to: 'users#new'
  
  resources :users, only: [:index, :show, :new, :create] do
    member do
      get :likes
    end
  end
  resources :users, only: [:index, :show, :new, :create]
  
  resources :posts, only: [:show, :edit, :new, :create, :update, :destroy]
  resources :favorites, only: [:create, :destroy]
end