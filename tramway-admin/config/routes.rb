# frozen_string_literal: true

Tramway::Admin::Engine.routes.draw do
  mount Tramway::Auth::Engine, at: '/auth'
  mount Tramway::Export::Engine, at: '/' if defined? Tramway::Export::Engine

  root to: 'welcome#index'

  resources :records
  resource :singleton, only: %i[new create show edit update]
end
