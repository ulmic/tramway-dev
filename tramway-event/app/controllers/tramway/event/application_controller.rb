# frozen_string_literal: true

module Tramway
  module Event
    class ApplicationController < ::Tramway::Core::ApplicationController
      protect_from_forgery with: :exception
    end
  end
end
