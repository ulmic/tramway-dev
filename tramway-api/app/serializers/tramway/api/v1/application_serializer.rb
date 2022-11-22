# frozen_string_literal: true

class Tramway::Api::V1::ApplicationSerializer < ActiveModel::Serializer
  include ::Tramway::Concerns::AttributesDecoratorHelper

  attribute :id

  def id
    id_method = Tramway::Api.default_id_method_of(model: object.class) || :uuid
    object.send(id_method)
  end

  def created_at
    object.created_at.iso8601
  end

  def updated_at
    object.updated_at.iso8601
  end
end
