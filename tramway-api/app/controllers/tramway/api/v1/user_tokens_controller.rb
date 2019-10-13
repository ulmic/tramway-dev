# frozen_string_literal: true

class Tramway::Api::V1::UserTokensController < ::Tramway::Api::V1::ApplicationController
  def create
    if entity.present? && entity.authenticate(auth_params[:password])
      token = auth_token
      render json: {
        auth_token: token,
        user: {
          email: @entity.email,
          uid: @entity.uid,
          id: @entity.id
        }
      }, status: :created
    else
      not_found
    end
  end
end
