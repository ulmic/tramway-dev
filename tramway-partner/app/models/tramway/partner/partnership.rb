# frozen_string_literal: true

class Tramway::Partner::Partnership < ::Tramway::ApplicationRecord
  belongs_to :organization, class_name: 'Tramway::Partner::Organization'
  belongs_to :partner, polymorphic: true

  enumerize :partnership_type, in: %i[organizator program support info customer], default: :organizator
  enumerize :partner_type, in: ['Tramway::Event::Event', 'Tramway::Conference::Unity']
end
