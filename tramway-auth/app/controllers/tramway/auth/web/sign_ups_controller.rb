# frozen_string_literal: true

class Tramway::Auth::Web::SignUpsController < Tramway::Auth::Web::ApplicationController
  before_action :check_authenticable_models

  def create
    @form = "#{model_class}SignUpForm".constantize.new model_class.new
    if @form.submit params[:record]
      redirect_to Rails.application.routes.url_helpers.root_path flash: :success
    else
      redirect_to Rails.application.routes.url_helpers.root_path flash: :error, errors: @form.errors.messages, record: @form.attributes
    end
  end

  private

  def check_authenticable_models
    return unless params[:model].in? Tramway::Auth.authenticable_models
  end
end
