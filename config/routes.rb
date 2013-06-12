SocialThing::Application.routes.draw do
  resources :users
  resources :friend_circles
  resource :session, only: [:new, :create, :destroy]
  resources :posts
end