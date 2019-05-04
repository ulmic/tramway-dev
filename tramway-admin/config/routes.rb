Tramway::Admin::Engine.routes.draw do
  mount Tramway::Auth::Engine, at: '/auth'

  root to: 'welcome#index'

  resources :records
  resource :singleton, only: [ :new, :create, :show, :edit, :update ]
end
