# frozen_string_literal: true

class Tramway::Auth::Web::SignUpsController < Tramway::Auth::Web::ApplicationController
  before_action :check_authenticable_models

  def create
    @form = "Public::#{model_class}SignUpForm".constantize.new model_class.new
    if @form.submit params[:user]
      additional_params = { flash: :success_user_sign_up }
      url = if params[:success_redirect].present?
              [params[:success_redirect], '?', additional_params.to_query].join
            else
              Rails.application.routes.url_helpers.root_path(flash: :success)
            end
      sign_in @form.model if @form.class.sign_in_after
      redirect_to url
    else
      additional_params = { flash: :error_user_sign_up, errors: @form.errors.messages, record: @form.attributes }
      url = if params[:error_redirect].present?
              [params[:error_redirect], '?', additional_params.to_query].join
            else
              Rails.application.routes.url_helpers.root_path(**additional_params)
            end
      redirect_to url
    end
  end

  private

  def check_authenticable_models
    return unless params[:model].in? Tramway::Auth.authenticable_models
  end
end
