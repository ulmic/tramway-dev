class Tramway::Event::EventLinkDecorator < ::Tramway::Core::ApplicationDecorator
  delegate :title, to: :object

  def link
    ''
  end
end
