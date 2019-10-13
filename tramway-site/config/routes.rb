# frozen_string_literal: true

Tramway::Site::Engine.routes.draw do
  mount Tramway::Auth::Engine, at: '/auth'
  mount Tramway::Admin::Engine, at: '/admin'

  root to: 'web/welcome#index'
end
