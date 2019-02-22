module Tramway
  module Api
    module V1
      class ApplicationController < ::Tramway::Api::ApplicationController
        private

        def render_errors_for(model)
          render json: model, status: :unprocessable_entity, serializer: ::Tramway::Api::V1::ErrorSerializer
        end
      end
    end
  end
end
