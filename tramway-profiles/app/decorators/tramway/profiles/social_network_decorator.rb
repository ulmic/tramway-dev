# frozen_string_literal: true

class ::Tramway::Profiles::SocialNetworkDecorator < ::Tramway::ApplicationDecorator
  class << self
    def collections
      [:all]
    end
  end

  delegate :title, to: :object

  def name
    "#{object.network_name} | #{object.title}"
  end
end
