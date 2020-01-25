# frozen_string_literal: true

class Tramway::Event::EventDecorator < ::Tramway::Core::ApplicationDecorator
  class << self
    def collections
      [:all]
    end

    def show_attributes
      %i[
        title
        duration
        events_link
        state
        created_at
        photo
        status
        request_collecting_duration
        description
      ]
    end

    def list_attributes
      %i[requested_participants approved_participants events_link]
    end
  end

  delegate :title, to: :object
  delegate :status, to: :object
  decorate_association :participants
  decorate_association :participant_form_fields
  decorate_association :sections
  decorate_association :partakings
  decorate_association :partnerships
  decorate_association :organizations

  def background
    object.photo
  end

  def description
    raw object.description
  end

  def photo
    image_view object.photo
  end

  def created_at
    date_view object.created_at
  end

  def participants_list
    content_tag :a, href: ::Tramway::Admin::Engine.routes.url_helpers.records_path(model: ::Tramway::Event::Participant, filter: { event_id_eq: object.id }) do
      I18n.t('helpers.links.open')
    end
  end

  def duration(begin_date: object.begin_date, end_date: object.end_date)
    if begin_date.to_date == end_date.to_date
      I18n.l(begin_date, format: '%d %B %Y').to_s
    elsif begin_date.month == end_date.month
      "#{I18n.t('date.from')} #{I18n.l(begin_date, format: '%d')} #{I18n.t('date.to')} #{I18n.l(end_date, format: '%d %B %Y')}"
    else
      "#{I18n.t('date.from')} #{I18n.l(begin_date, format: '%d %B %Y')} #{I18n.t('date.to')} #{I18n.l(end_date, format: '%d %B %Y')}"
    end
  end

  def events_link
    fa_icon 'link'
    events_link = Tramway::Event::Engine.routes.url_helpers.event_path object
    link_to 'ссылка на мероприятие', ['http://molodoy.online', events_link].join
    content_tag(:div) do
      concat link_to ['http://molodoy.online', events_link].join, ['http://molodoy.online', events_link].join
      concat fa_icon 'copy'
    end
  end

  def request_collecting_duration
    return if object.request_collecting_begin_date.nil? || object.request_collecting_end_date.nil?

    duration begin_date: object.request_collecting_begin_date, end_date: object.request_collecting_end_date
  end

  def requested_participants
    object.participants.count
  end

  def approved_participants
    if object.end_date.present?
      if DateTime.now < object.end_date
        I18n.t('activerecord.attributes.tramway/event/event.not_yet_held')
      else
        object.participants.approved.count
      end
    else
      I18n.t('activerecord.attributes.tramway/event/event.does_not_have_end_date')
    end
  end

  def state
    state_machine_view object, :state
  end

  def status
    enumerize_view object.status
  end

  alias tagline duration
end
