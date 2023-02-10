class Tramway::User < Tramway::ApplicationRecord
  has_secure_password

  has_many :social_networks, as: :record, class_name: 'Tramway::Profiles::SocialNetwork'
end
