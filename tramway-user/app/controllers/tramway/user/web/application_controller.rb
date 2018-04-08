require_dependency "tramway/user/application_controller"

module Tramway::User
  class Web::ApplicationController < ApplicationController
    include AuthManagment
  end
end
