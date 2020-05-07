# frozen_string_literal: true

class Tramway::Landing::BlockLinkDecorator < ::Tramway::Landing::Navbar::LinkDecorator
  delegate :title, to: :object

  def link
    "##{object.anchor}"
  end
end
