# frozen_string_literal: true

Tramway::Conference::Engine.routes.draw do
  mount Tramway::Engine, at: '/admin'
  mount Tramway::News::Engine, at: '/'
  mount Tramway::Event::Engine, at: '/'
  mount Tramway::Page::Engine, at: '/page'

  root to: 'web/welcome#index'
end
