Rails.application.routes.draw do
  devise_for :users, :controllers => { :registrations => "user/registrations"}
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'users#portfolio'
  get 'portfolio', to: 'users#portfolio'
  get 'search_stocks', to: 'stocks#search'
  get 'friends', to: 'users#friends'
  #path for create & destroy route
  resources :user_stocks, only: [:create, :destroy]
  resources :users, only: [:show]
  resources :friendships
end