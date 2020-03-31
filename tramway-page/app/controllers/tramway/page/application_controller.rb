# frozen_string_literal: true

class Tramway::Page::ApplicationController < Tramway::Core::ApplicationController
  protect_from_forgery with: :exception
end
