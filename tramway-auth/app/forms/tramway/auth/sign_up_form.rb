# frozen_string_literal: true

class Tramway::Auth::SignUpForm < Tramway::ApplicationForm
  class << self
    attr_accessor :sign_in_after
  end
end
