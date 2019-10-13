# frozen_string_literal: true

Rails.application.routes.draw do
  mount Tramway::Export::Engine => '/tramway-export'
end
