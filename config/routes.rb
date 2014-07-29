Rails.application.routes.draw do
  resources :ctps

  resources :scores

  resources :games

  resources :players

  resources :dg_leagues, only: [:show, :edit, :create, :update, :destroy, :index, :new]
  get '/league/:id', to: "dg_leagues#show"
 # get '/:name', to: "dg_leagues#show"

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users
  get 'pages/index'
  root 'pages#index'
end
