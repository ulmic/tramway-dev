require 'tramway/helpers/class_name_helpers'

class Tramway::Api::V1::UsersController < ::Tramway::Api::V1::ApplicationController
  before_action :authenticate_user, only: :show
  include Tramway::ClassNameHelpers

  def create
    user_form = form_class_name(Tramway::Api.user_based_model).new Tramway::Api.user_based_model.new
    if user_form.submit params[Tramway::Api.user_based_model.name.underscore]
      token = ::Knock::AuthToken.new(payload: { sub: user_form.model.id }).token
      # FIXME refactor this bullshit
      serialized_user = OpenStruct.new(
        user_form.model.attributes.merge(
          authentication_token: token,
          id: user_form.model.uid
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
end
