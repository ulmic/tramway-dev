# frozen_string_literal: true
require 'tramway/api/authenticate_helper'

class Tramway::Api::V1::UserTokensController < ::Tramway::Api::V1::ApplicationController
  before_action :authenticate
  include Tramway::Api::AuthenticateHelper

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
