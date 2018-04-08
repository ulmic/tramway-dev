class Tramway::Profiles::SocialNetwork < ::Tramway::Core::ApplicationRecord
  belongs_to :record, polymorphic: true

  enumerize :network_name, in: [ :vk, :facebook, :twitter, :instagram ]
  #enumerize :record_type, in: ::Tramway::Profiles.records
  enumerize :record_type, in: [ 'Tramway::SportSchool::Institution' ], default: 'Tramway::SportSchool::Institution'
end
