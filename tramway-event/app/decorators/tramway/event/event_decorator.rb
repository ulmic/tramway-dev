class Tramway::Event::EventDecorator < ::Tramway::Core::ApplicationDecorator
  class << self
    def collections
      [ :all ]
    end
  end

  delegate :title, to: :object
  delegate :description, to: :object
  delegate :participant_form_fields, to: :object
  delegate :sections, to: :object
  decorate_association :participants

  def background
    object.photo
  end

  def duration
    if object.begin_date.to_date == object.end_date.to_date
      "#{I18n.l(object.begin_date, format: '%d %B %Y')}"
    elsif object.begin_date.month == object.end_date.month
      "#{I18n.t('date.from')} #{I18n.l(object.begin_date, format: '%d')} #{I18n.t('date.to')} #{I18n.l(object.end_date, format: '%d %B %Y')}"
    else
      "#{I18n.t('date.from')} #{I18n.l(object.begin_date, format: '%d %B %Y')} #{I18n.t('date.to')} #{I18n.l(object.end_date, format: '%d %B %Y')}"
    end
  end

  alias tagline duration
end
