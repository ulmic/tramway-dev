class Tramway::Export::ApplicationController < Tramway::Core::ApplicationController
  before_action :authenticate_admin!
end
