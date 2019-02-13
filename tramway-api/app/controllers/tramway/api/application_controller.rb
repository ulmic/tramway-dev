module Tramway
  module Api
    class ApplicationController < ::Tramway::Core::ApplicationController
      include Knock::Authenticable
      protect_from_forgery with: :null_session, if: proc { |c| c.request.format == 'application/json' }
    end
  end
end
