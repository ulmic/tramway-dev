# frozen_string_literal: true

class Tramway::Api::AuthenticationForm < Tramway::Core::ApplicationForm
  properties :email, :password
end
