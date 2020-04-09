# frozen_string_literal: true

Tramway::Page::Engine.routes.draw do
  get '/:slug' => 'pages#show', as: :page
  resources :previews, only: :show
end
