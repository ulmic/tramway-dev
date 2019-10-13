# frozen_string_literal: true

module Tramway::SportSchool
  class Institution < ::Tramway::Core::ApplicationRecord
    has_many :social_networks, as: :record, class_name: 'Tramway::Profiles::SocialNetwork'
  end
end
