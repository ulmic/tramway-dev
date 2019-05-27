# frozen_string_literal: true

class Tramway::Api::V1::ApplicationSerializer < ActiveModel::Serializer
  include ::Tramway::Core::Concerns::AttributesDecoratorHelper

  def created_at
    object.created_at.iso8601
  end

  def updated_at
    object.updated_at.iso8601
  end
end
