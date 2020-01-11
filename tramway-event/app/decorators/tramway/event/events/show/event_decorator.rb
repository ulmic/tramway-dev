# frozen_string_literal: true

class Tramway::Event::Events::Show::EventDecorator < ::Tramway::Core::ApplicationDecorator
  class << self
    def collections
      [:all]
    end
  end

  delegate :title, to: :object
  delegate :description, to: :object
  delegate :participant_form_fields, to: :object
  delegate :sections, to: :object
  delegate :partakings, to: :object
  delegate :request_collecting_state, to: :object

  if defined?(::Tramway::Partner)
    ::Tramway::Partner::Partnership.partnership_type.values.each do |partnership_type|
      decorate_association partnership_type.to_s.pluralize
    end
  end

  def background
    object.photo
  end

  def duration
    if object.begin_date.to_date == object.end_date.to_date
      I18n.l(object.begin_date, format: '%d %B %Y').to_s
    elsif object.begin_date.month == object.end_date.month
      "#{I18n.t('date.from')} #{I18n.l(object.begin_date, format: '%d')} #{I18n.t('date.to')} #{I18n.l(object.end_date, format: '%d %B %Y')}"
    else
      "#{I18n.t('date.from')} #{I18n.l(object.begin_date, format: '%d %B %Y')} #{I18n.t('date.to')} #{I18n.l(object.end_date, format: '%d %B %Y')}"
    end
  end

  def partners
    if defined?(::Tramway::Partner)
      @partners ||= ::Tramway::Partner::Partnership.partnership_type.values.reduce({}) do |hash, partnership_type|
        hash.merge! partnership_type => (object.send(partnership_type.to_s.pluralize).active.map do |partner|
          Tramway::Partner::OrganizationFeatureDecorator.decorate partner
        end)
      end
    end
  end

  alias tagline duration
end
