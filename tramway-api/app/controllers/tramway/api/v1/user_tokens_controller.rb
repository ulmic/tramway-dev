# frozen_string_literal: true

class Tramway::Api::V1::UserTokensController < ::Tramway::Api::V1::ApplicationController
  def create
    if entity.present? && entity.authenticate(auth_params[:password])
      token = auth_token
      render json: {
        auth_token: token,
        user: {
          email: @entity.email,
          uuid: @entity.uuid
        }
      }, status: :created
    else
      unauthorized
    end
  end
end
