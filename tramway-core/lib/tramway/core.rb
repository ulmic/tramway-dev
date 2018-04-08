require "tramway/core/engine"
require 'tramway/core/generators/install_generator'
require 'tramway/core/application'

module Tramway
  module Core
    class << self
      def initialize_application(**options)
        @application ||= Tramway::Core::Application.new
        options.each do |attr, value|
          @application.send "#{attr}=", value
        end
      end

      def application
        @application
      end
    end
  end
end
