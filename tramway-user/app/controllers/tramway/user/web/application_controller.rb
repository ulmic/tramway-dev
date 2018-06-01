require_dependency "tramway/user/application_controller"

class Tramway::User::Web::ApplicationController < ::Tramway::User::ApplicationController
  include AuthManagment
end
