Rails.application.routes.draw do
  scope :api do
    resources :users, except: [:create]
    resources :items
    post 'register', to: 'authentications#register'
    post 'login', to: 'authentications#login'
    post 'oauth/github'
    post 'oauth/facebook'
    resources :conversations, only: [:index, :create, :show, :destroy] do
      resources :messages, only: [:index, :create]
    end
  end
end
