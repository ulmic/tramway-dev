require "tramway/auth/engine"

module Tramway
  module Auth
    class << self
      def root
        File.dirname __dir__
      end

      def layout_path=(path)
        @layout_path = path
      end

      def layout_path
        @layout_path ||= 'tramway/user/application'
      end

      def root_path=(path)
        @root_path = path
      end

      def root_path
        @root_path || '/'
      end
    end
  end
end
