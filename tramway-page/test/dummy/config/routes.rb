# frozen_string_literal: true

Rails.application.routes.draw do
  mount Tramway::Page::Engine => '/tramway-page'
end
