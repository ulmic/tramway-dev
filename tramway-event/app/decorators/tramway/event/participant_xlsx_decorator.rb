class Tramway::Event::ParticipantXlsxDecorator < Tramway::Export::Xlsx::ApplicationDecorator
  class << self
    def columns
      [ :full_name, :email, :phone, :organization, :event ].map do |attribute|
        { Tramway::Event::Participant.human_attribute_name(attribute).to_sym => attribute }
      end
    end

    def filename
      'participants.xlsx'
    end
  end

  def full_name
    "#{object.values['Фамилия'] || object.values['Фамилия ']} #{object.values['Имя'] || object.values['Имя ']}"
  end

  def email
    object.values['Email']
  end

  def phone
    object.values['Телефон']
  end

  def organization
    object.values['Место работы/ Учебное заведение']
  end

  def event
    object.event.title
  end
end
