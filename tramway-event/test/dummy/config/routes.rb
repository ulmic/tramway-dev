# frozen_string_literal: true

Rails.application.routes.draw do
  mount Tramway::Event::Engine => '/tramway-event'
end
