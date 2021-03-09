# frozen_string_literal: true

module Tramway
  module Export
    module Xls
      class ApplicationDecorator < Tramway::Export::ApplicationDecorator
        def flexible_columns
          []
        end
      end
    end
  end
end
