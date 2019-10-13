# frozen_string_literal: true

Tramway::Event::Engine.routes.draw do
  resources :events, only: :show
  resources :participants, only: :create
end
