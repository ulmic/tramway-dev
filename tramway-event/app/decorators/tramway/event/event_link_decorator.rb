# frozen_string_literal: true

class Tramway::Event::EventLinkDecorator < ::Tramway::Landing::Navbar::LinkDecorator
  delegate :title, to: :object

  def link
    Tramway::Event::Engine.routes.url_helpers.event_path object
  end
end
