# frozen_string_literal: true

class Tramway::Page::Page < ::Tramway::Core::ApplicationRecord
  enumerize :page_type, in: [ :custom, :landing ], default: :custom

  scope :landings, -> { where page_type: :landing }
end
