# frozen_string_literal: true

class Tramway::Event::ParticipantXlsxDecorator < Tramway::Export::Xlsx::ApplicationDecorator
  class << self
    def columns
      %i[full_name email phone organization event].map do |attribute|
        { Tramway::Event::Participant.human_attribute_name(attribute).to_sym => attribute }
      end
    end

    def filename
      'participants.xlsx'
    end
  end

  def full_name
    return unless object.values

    "#{object.values['Фамилия'] || object.values['Фамилия ']} #{object.values['Имя'] || object.values['Имя ']}"
  end

  def email
    return unless object.values

    object.values['Email']
  end

  def phone
    return unless object.values

    object.values['Телефон']
  end

  def organization
    return unless object.values

    object.values['Место работы/ Учебное заведение']
  end

  def event
    object.event.title
  end
end
