Rails.application.routes.draw do
  resources :comments
  resources :comments ,:users ,:games
  get 'log_in' => 'sessions#new', :as => 'log_in'
  get 'sign_up' => 'users#new', :as =>  'sign_up'
  resources 'sessions','users','games'
  get 'signout' => 'sessions#destroy' ,:as =>'signout'
  root 'games#index'
  get 'games_all' => 'games#index' , :as => 'games_all'
  get 'show_comments' => 'comments#show' , :as => 'show_comments'
  #fb
  	match 'auth/:provider/callback', to: 'users#createFB', via: [:get, :post]
	match 'auth/failure', to: redirect('/'), via: [:get, :post]
	match 'signout', to: 'sessions#destroy', as: 'FBsignout', via: [:get, :post]
end