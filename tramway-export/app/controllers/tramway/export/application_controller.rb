module Tramway
  module Export
    class ApplicationController < Tramway::Core::ApplicationController
      protect_from_forgery with: :exception

      include Tramway::ClassNameHelpers
    end
  end
end
