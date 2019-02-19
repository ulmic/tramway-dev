Tramway::Api::Engine.routes.draw do
  namespace :v1 do
    resource :user_token, only: [ :create ]
    resource :user, only: [ :create, :show ]
  end
end
