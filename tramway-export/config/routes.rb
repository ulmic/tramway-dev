# frozen_string_literal: true

Tramway::Export::Engine.routes.draw do
  resources :exports, only: [] do
    collection do
      get :show
    end
  end
end
