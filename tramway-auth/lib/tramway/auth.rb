# frozen_string_literal: true

require 'tramway/auth/engine'

module Tramway
  module Auth
    class << self
      def authenticable_models
        @authenticable_models ||= []
      end

      def authenticable_models=(value)
        @authenticable_models ||= []
        if value.is_a? Array
          @authenticable_models += value
        else
          @authenticable_models << value
        end
      end

      def root
        File.dirname __dir__
      end

      attr_writer :layout_path

      def layout_path
        @layout_path ||= 'tramway/user/application'
      end

      attr_writer :root_path

      def root_path
        @root_path || '/'
      end
    end
  end
end
