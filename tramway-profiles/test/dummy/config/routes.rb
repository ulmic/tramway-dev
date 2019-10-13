# frozen_string_literal: true

Rails.application.routes.draw do
  mount Tramway::Profiles::Engine => '/tramway-profiles'
end
