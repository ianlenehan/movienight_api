Rails.application.routes.draw do

  namespace :api, defaults:{ format: :json } do
    namespace :v1 do
      devise_for :users
      resources :users, only: [:show, :update, :create, :destroy, :index]
      resources :groups, only: [:index, :create]
      resources :events, only: [:create]
      get '/groups/:id/members' => 'groups#members'
      post '/users/user_details' => 'users#user_details'
      post '/groups/join' => 'requests#new'
      resource :login, controller: :sessions
      get 'verify' => 'sessions#verify_access_token'
    end
  end
end
