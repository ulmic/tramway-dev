# frozen_string_literal: true

class Tramway::Profiles::SocialNetwork < Tramway::ApplicationRecord
  belongs_to :record, polymorphic: true, required: false

  enumerize :network_name, in: %i[vk facebook twitter instagram telegram patreon]
  enumerize :record_type, in: Tramway::Prefiles.records
end
