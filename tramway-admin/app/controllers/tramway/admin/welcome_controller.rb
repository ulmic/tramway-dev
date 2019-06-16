module Tramway::Admin
  class WelcomeController < ApplicationController
    skip_before_action :check_available!

    def index
    end
  end
end
