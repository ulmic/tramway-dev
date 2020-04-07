# frozen_string_literal: true

class Tramway::Page::Page < ::Tramway::Core::ApplicationRecord
  has_many :blocks, class_name: 'Tramway::Landing::Block'

  enumerize :page_type, in: %i[main other], default: :other

  scope :landings, -> { where page_type: :landing }
end
