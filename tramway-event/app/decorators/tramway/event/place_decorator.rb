class Tramway::Event::PlaceDecorator < Tramway::Core::ApplicationDecorator
  delegate :title, to: :object
end
