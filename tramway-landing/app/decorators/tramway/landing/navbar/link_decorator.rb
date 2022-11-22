# frozen_string_literal: true

class Tramway::Landing::Navbar::LinkDecorator < Tramway::ApplicationDecorator
  def title
    object[:title]
  end

  def link
    object[:link]
  end

  def icon
    object[:icon]
  end
end
