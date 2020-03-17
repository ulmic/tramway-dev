# frozen_string_literal: true

class Tramway::Event::ParticipantXlsDecorator < Tramway::Export::Xls::ApplicationDecorator
  class << self
    def columns
      %i[event].map do |attribute|
        { Tramway::Event::Participant.human_attribute_name(attribute).to_sym => attribute }
      end
    end

    def filename
      'participants.xls'
    end
  end

  delegate :values, to: :object

  def event
    object.event.title
  end

  def flexible_columns
    object.event.participant_form_fields.active.order(position: :asc).map(&:title).map do |key|
      { Tramway::Event::Participant.human_attribute_name(key).to_sym => -> { values&.dig(key) } }
    end
  end
end
