# frozen_string_literal: true

require 'tramway/helpers/class_name_helpers'

class Tramway::Api::V1::UsersController < ::Tramway::Api::V1::ApplicationController
  before_action :authenticate_user, only: :show
  include Tramway::ClassNameHelpers

  def create
    user_form = sign_up_form_class_name(user_based_model).new user_based_model.new
    # Implement JSON API spec here
    if user_form.submit snake_case params[:data][:attributes]
      token = ::Knock::AuthToken.new(payload: { sub: user_form.model.uid }).token
      # FIXME: refactor this bullshit
      serialized_user = OpenStruct.new(
        user_form.model.attributes.merge(
          authentication_token: token,
          uid: user_form.model.uid,
          id: user_form.model.id
        )
      )
      render json: serialized_user, status: :created
    else
      render_errors_for user_form
    end
  end

  def show
    render json: current_user, status: :ok
  end

  private

  def sign_up_form_class_name(model_class)
    form_class_name "#{model_class}SignUp"
  end

  def user_based_model
    params[:user_based_model].constantize if params[:user_based_model].in? Tramway::Api.user_based_models.map(&:to_s)
  end
end
