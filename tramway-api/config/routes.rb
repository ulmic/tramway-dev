# frozen_string_literal: true

Tramway::Api::Engine.routes.draw do
  namespace :v1 do
    resource :user_token, only: [:create]
    resource :user, only: %i[create show]
    resources :records
  end
end
