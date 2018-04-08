class Tramway::Conference::UnityDecorator < ::Tramway::Core::ApplicationDecorator
  class << self
    def collections
      [ :all ]
    end
  end

  delegate :logo, to: :object
end
