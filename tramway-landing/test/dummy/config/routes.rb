# frozen_string_literal: true

Rails.application.routes.draw do
  mount Tramway::Landing::Engine => '/tramway-landing'
end
