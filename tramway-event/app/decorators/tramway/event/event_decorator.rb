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

  def background
    object.photo
  end

  def tagline
    ''
  end

  def duration
    if object.begin_date.present? && object.end_date.present?
      "#{I18n.t('date.from')} #{I18n.l(object.begin_date.to_date)} #{I18n.t('date.to')} #{I18n.l(object.end_date.to_date)}"
    end
  end
end
