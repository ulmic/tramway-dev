require 'tramway/conference/engine'
require 'tramway/conference/generates/install_generator'
require 'font-awesome-rails'

module Tramway
  module Conference
    class << self
      def dependencies
        [ :landing, :event, :profiles ]
      end

      def application
        :unity
      end
    end
  end
end
