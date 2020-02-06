class Tramway::Event::EventAsPageWithButtonDecorator < Tramway::Event::EventDecorator
  def anchor
    "event_#{object.id}"
  end

  delegate :photo, to: :object
  delegate :title, to: :object
  alias background photo

  def description
    if object.short_description.present?
      content_tag :div do
        concat duration
        concat content_tag :br
        concat object.short_description
      end
    else
      duration
    end
  end

  def button
    content_tag :div do
      content_tag(
        :a,
        href: ::Tramway::Event::Engine.routes.url_helpers.event_path(object.id),
        class: 'btn btn-primary'
      ) do
        'Регистрация'
      end
    end
  end
end
