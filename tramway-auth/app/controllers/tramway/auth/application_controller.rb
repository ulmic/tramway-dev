# frozen_string_literal: true

class Tramway::Auth::ApplicationController < Tramway::Core::ApplicationController
  layout ::Tramway::Auth.layout_path
  protect_from_forgery with: :exception
  before_action :application

  def application
    if ::Tramway::Core.application
      @application = Tramway::Core.application&.model_class&.first || Tramway::Core.application
    end
  end
end
