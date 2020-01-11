# frozen_string_literal: true

class Tramway::Profiles::SocialNetwork < ::Tramway::Core::ApplicationRecord
  belongs_to :record, polymorphic: true, required: false

  enumerize :network_name, in: %i[vk facebook twitter instagram telegram patreon]
  enumerize :record_type, in: ((['Tramway::SportSchool::Institution', 'Tramway::Conference::Unity'].map do |type|
    type if const_defined?(type)
  end + [Tramway::Core.application_object.model_class]).compact)
end
