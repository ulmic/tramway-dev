# frozen_string_literal: true

class Tramway::Api::V1::ErrorSerializer < ActiveModel::Serializer
  # Based on https://github.com/rails-api/active_model_serializers/blob/master/lib/active_model/serializer/error_serializer.rb
  # @return [Hash<field_name,Array<error_message>>]
  def as_json
    error_messages(object)
  end

  def success?
    false
  end

  private

  def error_messages(object, path = []) # rubocop:disable Metrics/AbcSize, Metrics/MethodLength
    error_messages = {}

    object.errors.messages.each do |name, messages|
      error_messages.merge!((path + [name]).join('/') => messages)
    end

    if object.model
      object.model.errors.messages.each do |name, messages|
        error_messages.merge!((path + [name]).join('/') => messages)
      end
    end

    if object.model
      object.model.attributes.each do |attribute_key, attribute_value|
        if attribute_value.is_a?(Reform::Form)
          error_messages.merge!(error_messages(attribute_value, path + [attribute_key]))
        elsif attribute_value.is_a?(Array)
          attribute_value.each_with_index do |array_attribute_value, array_attribute_key|
            next unless array_attribute_value.is_a?(Reform::Form)

            error_messages.merge!(
              error_messages(
                array_attribute_value,
                path + [attribute_key] + [array_attribute_key]
              )
            )
          end
        end
      end
    end

    error_messages
  end
end
