class Tramway::Profiles::SocialNetwork < ::Tramway::Core::ApplicationRecord
  belongs_to :record, polymorphic: true

  enumerize :network_name, in: [ :vk, :facebook, :twitter, :instagram, :telegram ]
  #enumerize :record_type, in: ::Tramway::Profiles.records
  #
  # HACK
  enumerize :record_type, in: [ 'Tramway::SportSchool::Institution', 'Tramway::Conference::Unity' ], default: 'Tramway::SportSchool::Institution'
end
