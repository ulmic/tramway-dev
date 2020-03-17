# frozen_string_literal: true

class Tramway::User::UserDecorator < ::Tramway::Core::ApplicationDecorator
  class << self
    def collections
      [:all]
    end

    def list_attributes
      [:email]
    end

    def show_attributes
      %i[email first_name last_name phone role created_at updated_at]
    end
  end

  delegate_attributes :first_name, :last_name, :email, :phone, :role, :created_at, :updated_at

  def name
    "#{object.first_name} #{object.last_name}"
  end
end
