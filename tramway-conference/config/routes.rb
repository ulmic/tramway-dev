Tramway::Conference::Engine.routes.draw do
  mount Tramway::User::Engine, at: '/users'
  mount Tramway::Admin::Engine, at: '/admin'
  mount Tramway::News::Engine, at: '/'
  mount Tramway::Event::Engine, at: '/'

  root to: 'web/welcome#index'

  scope module: :web do
    resource :session, only: [ :new, :create, :destroy ]
  end
end
