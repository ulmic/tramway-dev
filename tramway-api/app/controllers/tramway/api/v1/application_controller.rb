module Tramway
  module Api
    module V1
      class ApplicationController < ::Tramway::Api::ApplicationController
        def render_errors_for(model)
          render json: model, status: :unprocessable_entity, serializer: ::Tramway::Api::V1::ErrorSerializer
        end

        def render_error_with_text(text)
          render json: { text: text }, status: :bad_request
        end
      end
    end
  end
end
