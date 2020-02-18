# frozen_string_literal: true

class Tramway::Api::V1::ApplicationSerializer < ActiveModel::Serializer
  include ::Tramway::Core::Concerns::AttributesDecoratorHelper

  attribute :id

  def id
    object.uuid
  end

  def created_at
    object.created_at.iso8601
  end

  def updated_at
    object.updated_at.iso8601
  end
end
