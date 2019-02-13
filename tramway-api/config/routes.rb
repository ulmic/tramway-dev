Tramway::Api::Engine.routes.draw do
  namespace :v1 do
    resources :users, only: [ :create ]
  end
end
