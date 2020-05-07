class Tramway::Landing::Navbar::LinkDecorator < Tramway::Core::ApplicationDecorator
  def title
    object[:title]
  end

  def link
    object[:link]
  end
end
