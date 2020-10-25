Rails.application.routes.draw do
  get 'users/unsubscribe' => "users#unsubscribe"

  resources :parkings do
    resource :favorites, only: [:create, :destroy]
  end
  get "parkings_search" => "parkings#search"
  resources :favorites, only: [:index]
  root 'home#top'
  get 'home/about'

  devise_for :users
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  resources :users, only: [:show, :edit, :update, :index] do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
   resource :relationships, only: [:create, :destroy]
  end
  get 'following_user' => 'relationships#following_user'
  get 'followed_user' => 'relationships#followed_user'

end
