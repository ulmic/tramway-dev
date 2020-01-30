# frozen_string_literal: true

class Tramway::Admin::WelcomeController < Tramway::Admin::ApplicationController
  skip_before_action :check_available!

  def index
    self.instance_exec(&::Tramway::Admin.welcome_page_actions) if block_given?
  end
end
