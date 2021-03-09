# frozen_string_literal: true

Tramway::Export::Engine.routes.draw do
  resources :exports, only: [ :show, :index ]
end
