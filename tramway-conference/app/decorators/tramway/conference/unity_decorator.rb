class Tramway::Conference::UnityDecorator < ::Tramway::Core::ApplicationDecorator
  class << self
    def collections
      [ :all ]
    end
  end

  delegate :logo, to: :object
  decorate_association :social_networks
end
