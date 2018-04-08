module Tramway::User
  class SessionForm < ::Tramway::Core::ApplicationForm
    properties :email
    attr_accessor :password 

    def model_name
      User
    end

    def validate(params)
      self.model.authenticate params[:password]
    end
  end
end
