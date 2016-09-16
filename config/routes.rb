Rails.application.routes.draw do

  namespace :api, defaults:{ format: :json } do
    namespace :v1 do
      devise_for :users
      resources :users, only: [:show, :update, :create, :destroy, :index]
      resources :groups, only: [:index]
      post '/users/user_details' => 'users#user_details'
      resource :login, controller: :sessions
      get 'verify' => 'sessions#verify_access_token'
    end
  end
end
