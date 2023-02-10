class Tramway::User < Tramway::ApplicationRecord
  has_many :social_networks, as: :record, class_name: 'Tramway::Profiles::SocialNetwork'
end
