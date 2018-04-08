module Tramway
  module News
    module ApplicationHelper
      include ::FontAwesome::Rails::IconHelper

      def title(text)
        content_for :title do
          text
        end
      end
    end
  end
end
