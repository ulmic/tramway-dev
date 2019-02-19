# frozen_string_literal: true
class Tramway::Api::V1::UserTokensController < ::Tramway::Api::V1::ApplicationController
  before_action :authenticate

  def create
    token = auth_token
    render json: {
      auth_token: token,
      user: {
        email: @entity.email
      }
    }, status: :created
  end
end
