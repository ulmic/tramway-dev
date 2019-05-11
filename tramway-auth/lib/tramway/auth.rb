require "tramway/auth/engine"

module Tramway
  module Auth
    class << self
      def authenticable_classes
        @authenticable_classes ||= []
      end

      def authenticable_classes=(value)
        @authenticable_classes ||= []
        if value.is_a? Array
          @authenticable_classes += value
        else
          @authenticable_classes << value
        end
      end
      
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
