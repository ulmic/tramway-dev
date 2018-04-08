Tramway::Admin::Engine.routes.draw do
  root to: 'welcome#index'

  resources :records
  resource :singleton, only: [ :show, :edit, :update ]
end
