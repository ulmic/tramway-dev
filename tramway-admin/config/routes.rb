Tramway::Admin::Engine.routes.draw do
  mount Tramway::Auth::Engine, at: '/auth'
  if defined? Tramway::Export
    mount Tramway::Export::Engine, at: '/'
  end

  root to: 'welcome#index'

  resources :records
  resource :singleton, only: [ :new, :create, :show, :edit, :update ]
end
