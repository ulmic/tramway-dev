require_dependency "tramway/auth/application_controller"

class Tramway::Auth::Web::ApplicationController < ::Tramway::Auth::ApplicationController
  include AuthManagement
end
