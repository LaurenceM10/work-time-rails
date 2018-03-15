Rails.application.routes.draw do
  devise_for :users


  # UserTeams Routes
  resources :user_teams

  # Teams Routes
  resources :team do
    member do
      get :events
    end

    member do
      post :event
    end
  end

  resources :events


  get 'home/index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "team#index"
end
