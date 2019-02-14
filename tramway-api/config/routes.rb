Tramway::Api::Engine.routes.draw do
  namespace :v1 do
    resource :user_token, only: [ :create ]
    resources :users, only: [ :create ]
  end
end
