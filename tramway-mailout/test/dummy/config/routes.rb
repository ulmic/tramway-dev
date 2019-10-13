# frozen_string_literal: true

Rails.application.routes.draw do
  mount Tramway::Mailout::Engine => '/tramway-mailout'
end
