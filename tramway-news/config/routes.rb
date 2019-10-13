# frozen_string_literal: true

Tramway::News::Engine.routes.draw do
  resources :news, only: :show
end
