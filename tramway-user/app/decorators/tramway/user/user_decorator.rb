# frozen_string_literal: true

class Tramway::User::UserDecorator < ::Tramway::Core::ApplicationDecorator
  class << self
    def collections
      [:all]
    end

    def list_attributes
      [:email]
    end
  end

  def name
    "#{object.first_name} #{object.last_name}"
  end

  delegate :email, to: :object
end
