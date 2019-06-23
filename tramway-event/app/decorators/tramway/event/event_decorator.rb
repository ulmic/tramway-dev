class Tramway::Event::EventDecorator < ::Tramway::Core::ApplicationDecorator
  class << self
    def collections
      [ :all ]
    end

    def show_attributes
      [ 
        :title,
        :duration,
        :state,
        :created_at,
        :photo,
        :status,
        :request_collecting_duration,
        :description,
        :participants_list
      ]
    end

    def list_attributes
      [ :requested_participants, :approved_participants ]
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
      "#{I18n.l(begin_date, format: '%d %B %Y')}"
    elsif begin_date.month == end_date.month
      "#{I18n.t('date.from')} #{I18n.l(begin_date, format: '%d')} #{I18n.t('date.to')} #{I18n.l(end_date, format: '%d %B %Y')}"
    else
      "#{I18n.t('date.from')} #{I18n.l(begin_date, format: '%d %B %Y')} #{I18n.t('date.to')} #{I18n.l(end_date, format: '%d %B %Y')}"
    end
  end

  def request_collecting_duration
    duration begin_date: object.request_collecting_begin_date, end_date: object.request_collecting_end_date
  end

  def requested_participants
    object.participants.count
  end

  def approved_participants
    if DateTime.now < object.end_date
      I18n.t('activerecord.attributes.tramway/event/event.not_yet_held')
    else
      object.participants.approved.count
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
