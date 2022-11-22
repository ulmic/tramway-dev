# frozen_string_literal: true

class Tramway::Auth::ApplicationController < Tramway::ApplicationController
  layout ::Tramway::Auth.layout_path
  protect_from_forgery with: :exception
  before_action :application

  def application
    if ::Tramway.application
      @application = Tramway.application&.model_class&.first || Tramway.application
    end
  end
end
