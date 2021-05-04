Rails.application.routes.draw do
  get 'chat/:id', to: 'chats#show', as: 'chat'
  devise_for :users
  
  root to:'homes#top'
  get 'home/about' => 'homes#about'
  
  resources :books
  resources :users,only: [:show,:index,:edit,:update] do
    member do
      get :following, :followers
     end
  end
  resources :relationships,only: [:create, :destroy]
  resources :chats, only: [:create]
end