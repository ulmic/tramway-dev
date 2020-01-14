# frozen_string_literal: true

class Tramway::Event::ParticipantDecorator < ::Tramway::Core::ApplicationDecorator
  include HTMLTagsHelpers
  class << self
    def collections
      %i[requested waiting prev_approved without_answer approved rejected reserved all]
    end

    def list_attributes
      [:list_fields]
    end
    delegate :human_participation_state_event_name, to: :model_class

    def show_attributes
      %i[id event values state created_at updated_at participation_state comment]
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
  
  def event
    object.event.title
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
        hash = if field.options.is_a?(Hash)
                 field.options
               else
                 begin
                   JSON.parse(field.options.present? ? field.options : '{}')
                 rescue StandardError => e
                   I18n.t('.invalid_field_with_error', e)
                 end
               end
        if hash.is_a? Hash
          if hash.dig('list_field') == 'true'
            concat(content_tag(:tr) do
              concat(content_tag(:td) do
                field.title
              end)
              concat(content_tag(:td) do
                value = object.values&.dig(field.title)
                if russian_phone_number?(value)
                  tel_tag value
                else
                  value
                end
              end)
            end)
          end
        else
          hash
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
            concat(if russian_phone_number?(value)
                     tel_tag value
                   else
                     value
                   end)
          end)
        end)
      end
    end
  end

  def state
    state_machine_view object, :state
  end

  def created_at
    date_view object.created_at
  end

  def updated_at
    date_view object.updated_at
  end

  def participation_state
    state_machine_view object, :participation_state
  end
  
  delegate :comment, to: :object

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
    when :return_to_requested
      :warning
    end
  end

  private

  def russian_phone_number?(value)
    value.to_s.match(/((8|\+7)-?)?\(?\d{3}\)?-?\d{1}-?\d{1}-?\d{1}-?\d{1}-?\d{1}-?\d{1}-?\d{1}/)
  end
end
