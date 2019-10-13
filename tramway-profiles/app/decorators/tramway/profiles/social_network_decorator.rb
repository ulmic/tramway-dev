# frozen_string_literal: true

class ::Tramway::Profiles::SocialNetworkDecorator < ::Tramway::Core::ApplicationDecorator
  class << self
    def collections
      [:all]
    end
  end

  delegate :title, to: :object
end
