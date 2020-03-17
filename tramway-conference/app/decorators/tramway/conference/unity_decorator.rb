# frozen_string_literal: true

class Tramway::Conference::UnityDecorator < ::Tramway::Core::ApplicationDecorator
  class << self
    def collections
      [:all]
    end

    def show_attributes
      [ :title, :tagline, :logo, :address, :phone, :latitude, :longtitude, :url, :found_date, :email]
    end

    def show_associations
      [ :social_networks ]
    end
  end

  delegate_attributes :title, :logo, :tagline, :address, :phone, :latitude, :longtitude, :url, :found_date, :email

  decorate_association :social_networks
end
