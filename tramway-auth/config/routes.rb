# frozen_string_literal: true

Tramway::Auth::Engine.routes.draw do
  scope module: :web do
    resource :session, only: %i[new create destroy]
    resource :sign_up, only: :create
  end
end
