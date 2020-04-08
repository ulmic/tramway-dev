# frozen_string_literal: true

class Tramway::Auth::Web::SignUpsController < Tramway::Auth::Web::ApplicationController
  before_action :check_authenticable_models

  def create
    @form = "#{model_class}SignUpForm".constantize.new model_class.new
    if @form.submit params[:record]
      additional_params = { flash: :success }
      url = if params[:redirect].present?
              [ params[:redirect], '?', additional_params.to_query].join
            else
              Rails.application.routes.url_helpers.root_path(flash: :success)
            end
      redirect_to url
    else
      additional_params = { flash: :error, errors: @form.errors.messages, record: @form.attributes }
      url = if params[:redirect].present?
              [ params[:redirect], '?', additional_params.to_query].join
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
