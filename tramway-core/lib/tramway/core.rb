require "tramway/core/engine"
require "tramway/collection"
require "tramway/collections/helper"
require 'font-awesome-rails'
require 'reform'

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
