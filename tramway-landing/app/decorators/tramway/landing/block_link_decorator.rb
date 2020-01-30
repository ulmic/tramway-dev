class Tramway::Landing::BlockLinkDecorator < ::Tramway::Landing::LinkDecorator
  delegate :title, to: :object

  def link
    "##{object.anchor}"
  end
end
