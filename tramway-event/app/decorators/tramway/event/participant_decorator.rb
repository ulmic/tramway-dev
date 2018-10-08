class Tramway::Event::ParticipantDecorator < ::Tramway::Core::ApplicationDecorator
  class << self
    def collections
      [ :all ]
    end

    def list_attributes
      [:list_fields]
    end
  end

  decorate_association :event

  def title
    if object.values.present?
      first_name = object.values['Фамилия']
      last_name = object.values['Имя']
      patronymic = object.values['Отчество']
      "#{first_name} #{last_name} #{patronymic}"
    end
  end

  def list_fields
    content_tag :table, class: :table do
      object.event.participant_form_fields.map do |field|
        if field.options['list_field'] == 'true'
          concat(content_tag(:tr) do
            concat(content_tag(:td) do
              field.title
            end)
            concat(content_tag(:td) do
              object.values[field.title]
            end)
          end)
        end
      end.compact
    end
  end

  def values
    content_tag :table, class: :table do
      object.values&.each do |key, value|
        concat(content_tag(:tr) do
          concat(content_tag(:td) do
            key
          end)
          concat(content_tag(:td) do
            value
          end)
        end)
      end
    end
  end
end
