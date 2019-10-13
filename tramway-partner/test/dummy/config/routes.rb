# frozen_string_literal: true

Rails.application.routes.draw do
  mount Tramway::Partner::Engine => '/tramway-partner'
end
