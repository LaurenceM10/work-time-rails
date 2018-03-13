Rails.application.routes.draw do
  devise_for :users

  # Teams Routes
  resources :team

  # UserTeams Routes
  resources :user_teams



  get 'home/index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "team#index"
end
