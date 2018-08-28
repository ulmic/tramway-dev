Tramway::Admin::Engine.routes.draw do
  mount Tramway::User::Engine, at: '/users'

  root to: 'welcome#index'

  resources :records
  resource :singleton, only: [ :new, :create, :show, :edit, :update ]
end
