# frozen_string_literal: true

Tramway::SportSchool::Engine.routes.draw do
  mount Tramway::Auth::Engine, at: '/auth'
  mount Tramway::Engine, at: '/admin'
  mount Tramway::News::Engine, at: '/'
  mount Tramway::Page::Engine, at: '/pages'

  root to: 'web/welcome#index'

  scope module: :web do
    resource :session, only: %i[new create destroy]
  end
end
