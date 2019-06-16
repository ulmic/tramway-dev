module Tramway
  module News
    module ApplicationHelper
      include ::FontAwesome5::Rails::IconHelper

      def title(text)
        content_for :title do
          text
        end
      end
    end
  end
end
