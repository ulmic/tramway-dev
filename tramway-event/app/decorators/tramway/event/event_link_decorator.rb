class Tramway::Event::EventLinkDecorator < ::Tramway::Core::ApplicationDecorator
  delegate :title, to: :object

  def link
    Tramway::Event::Engine.routes.url_helpers.event_path object
  end
end
