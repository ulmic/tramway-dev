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

    if defined? Tramway::Conference
      def show_associations
        [:social_networks]
      end
    end
  end

  decorate_association :social_networks, as: :record if defined? Tramway::Conference

  delegate_attributes :first_name, :last_name, :email, :phone, :role, :created_at, :updated_at, :admin?

  def name
    "#{object&.first_name} #{object&.last_name}"
  end
  
  alias title name
end
