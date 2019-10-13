# frozen_string_literal: true

class Tramway::Profiles::SocialNetwork < ::Tramway::Core::ApplicationRecord
  belongs_to :record, polymorphic: true

  enumerize :network_name, in: %i[vk facebook twitter instagram telegram patreon]
  # enumerize :record_type, in: ::Tramway::Profiles.records
  #
  # HACK
  enumerize :record_type, in: ['Tramway::SportSchool::Institution', 'Tramway::Conference::Unity'], default: 'Tramway::SportSchool::Institution'
end
