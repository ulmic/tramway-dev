# frozen_string_literal: true

class Tramway::Admin::WelcomeController < Tramway::Admin::ApplicationController
  skip_before_action :check_available!

  def index; end
end
