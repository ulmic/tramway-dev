require 'tramway/conference/engine'
require 'tramway/conference/generates/install_generator'
require 'font-awesome-rails'

module Tramway
  module Conference
    class << self
      def dependencies
        [ :landing ]
      end
    end
  end
end
