class Tramway::Event::ParticipantDecorator < ::Tramway::Core::ApplicationDecorator
  class << self
    def collections
      [ :requested, :waiting, :prev_approved, :without_answer, :approved, :rejected, :reserved, :all ]
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
      concat(content_tag(:tr) do
        concat(content_tag(:td) do
          object.class.human_attribute_name(:event)
        end)
        concat(content_tag(:td) do
          object.event.title
        end)
      end)
      object.event.participant_form_fields.map do |field|
        hash = field.options.is_a?(Hash) ? field.options : JSON.parse(field.options.present? ? field.options : '{}')
        if hash.dig('list_field') == 'true'
          concat(content_tag(:tr) do
            concat(content_tag(:td) do
              field.title
            end)
            concat(content_tag(:td) do
              object.values&.dig( field.title )
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

  def participation_state_button_color(event)
    case event
    when :previous_approve, :approve
      :success
    when :wait_for_decision, :not_got_answer
      :warning
    when :reject
      :danger
    when :reserve
      :warning
    end
  end
end
