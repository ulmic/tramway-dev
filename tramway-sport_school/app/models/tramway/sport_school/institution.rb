# frozen_string_literal: true

class Tramway::SportSchool::Institution < ::Tramway::ApplicationRecord
  has_many :social_networks, as: :record, class_name: 'Tramway::Profiles::SocialNetwork'
end
