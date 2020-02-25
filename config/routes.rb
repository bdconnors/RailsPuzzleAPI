Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :users
        get 'users', to: 'api/v1/users#index'
        get 'users/:id', to: 'api/v1/users#show'
        post 'users', to: 'api/v1/users#create'
        put 'users/:id', to: 'api/v1/users#update'
      resources :login
      post 'login',to: 'api/v1/login#update'

    end
  end
end