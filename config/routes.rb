Rails.application.routes.draw do
  resources :ctps

  resources :scores

  resources :games

  resources :players do
    get :autocomplete_player_first_name, on: :collection
  end

  get '/api/players/search', to: "players#search"
  post '/api/scores/create', to: "scores#create"


  resources :dg_leagues, only: [:show, :edit, :create, :update, :destroy, :index, :new]
  get '/league/:id', to: "dg_leagues#show"
  get '/league/:name', to: "dg_leagues#show"

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users
  get 'pages/index'
  root 'pages#index'
end
