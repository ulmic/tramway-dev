# frozen_string_literal: true

class Tramway::Conference::UnityDecorator < ::Tramway::ApplicationDecorator
  class << self
    def collections
      [:all]
    end

    def show_attributes
      %i[title tagline logo address phone latitude longtitude url found_date email favicon]
    end

    def show_associations
      [:social_networks]
    end
  end

  delegate_attributes :title, :logo, :tagline, :address, :phone, :latitude, :longtitude, :url, :found_date, :email, :favicon

  decorate_association :social_networks
end
