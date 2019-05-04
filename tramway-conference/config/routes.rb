Tramway::Conference::Engine.routes.draw do
  mount Tramway::Auth::Engine, at: '/auth'
  mount Tramway::Admin::Engine, at: '/admin'
  mount Tramway::News::Engine, at: '/'
  mount Tramway::Event::Engine, at: '/'
  mount Tramway::Page::Engine, at: '/page'

  root to: 'web/welcome#index'

  scope module: :web do
    resource :session, only: [ :new, :create, :destroy ]
  end
end
