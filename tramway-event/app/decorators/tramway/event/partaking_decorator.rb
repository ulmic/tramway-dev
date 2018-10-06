class Tramway::Event::PartakingDecorator < ::Tramway::Core::ApplicationDecorator
  class << self
    def collections
      [ :all ]
    end
  end

  def name
    "#{object.person.first_name} #{object.person.last_name} - #{object.position}"
  end
end
